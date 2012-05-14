class PollinatorDataController < ApplicationController

  def new
    @observation = Observation.find(params[:observation_id])
    @pollinator_datum = PollinatorDatum.new
    @pollinator_datum.observation = @observation
  end

  def create
    new
    @pollinator_datum.attributes = params[:pollinator_datum]

    if @pollinator_datum.save
      if params[:commit] =~ /done/
        redirect_to thanks_path
      else
        redirect_to new_observation_pollinator_datum_path(@observation)
      end
    else
      flash.now[:error] = "Bummer! There was an problem with your plant data."
      render :new
    end

  end
  
end
