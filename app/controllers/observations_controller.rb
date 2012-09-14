require 'fastercsv'
class ObservationsController < ApplicationController

  def index
    @observations = Observation.all
    respond_to do |format|
      format.html
      format.csv do
        render_csv("upp-data-#{Time.now.strftime("%Y%m%d")}")
      end
    end
  end

  def new
    @observation = Observation.new
    @ppatches = Ppatch.all
  end

  def create
    new
    update
  end

  def edit
    @observation = Observation.find_by_id params[:id]
  end

  def update
    Observation.transaction do
      %w{name weather1 weather2 temperature}.each do |field|
        @observation[field] = params[:observation][field] unless params[:observation][field].blank?
      end

      @observation.observed_at = convert_date(params[:observation], 'observed_at')

      ppatch = if !params[:ppatch_name].blank?
        p = Ppatch.find_by_name params[:ppatch_name]
        unless p 
          p = Ppatch.create(:name => params[:ppatch_name])
        end
        p
      else
        Ppatch.find_by_id params[:observation][:ppatch]
      end
      @observation.ppatch = ppatch

      if @observation.save
        redirect_to new_observation_plant_datum_path(@observation)
      else
        flash.now[:error] = "Bummer! There was an problem with your Observation."
        render :new
      end
    end
  end

  def thanks
    
  end
  
  private
  
  def render_csv(filename = nil)
    filename ||= params[:action]
    filename += '.csv'

    if request.env['HTTP_USER_AGENT'] =~ /msie/i
      headers['Pragma'] = 'public'
      headers["Content-type"] = "text/plain" 
      headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
      headers['Content-Disposition'] = "attachment; filename=\"#{filename}\"" 
      headers['Expires'] = "0" 
    else
      headers["Content-Type"] ||= 'text/csv'
      headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" 
    end

    render :layout => false
  end

end
