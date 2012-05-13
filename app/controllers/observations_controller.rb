class ObservationsController < ApplicationController

  def index
    @observations = Observation.all
  end

  def new
    @observation = Observation.new
    @ppatches = Ppatch.all
  end

  def create
    Observation.transaction do
      new
      %w{name weather1 weather2 temperature}.each do |field|
        @observation[field] = params[:observation][field]
      end

      observed_at_params = params[:observation].select{|k,v| k =~ /observed_at/}
      @observation.attributes = observed_at_params

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
        redirect_to new_observation_plant_observation_path(@observation)
      else
        flash[:error] = "Bummer! There was an error with your Observation."
        render :new
      end
    end
  end

end
