class PlantDataController < ApplicationController

  def new
    @observation = Observation.find(params[:observation_id])
    @plant_datum = PlantDatum.new
    @plant_datum.observation = @observation
  end

  def create
    new
    @plant_datum.attributes = params[:plant_datum]

    if @plant_datum.save
      if params[:commit] =~ /pollinator/
        redirect_to new_observation_pollinator_datum_path(@observation)
      else
        redirect_to new_observation_plant_datum_path(@observation)
      end
    else
      flash.now[:error] = "Bummer! There was an problem with your plant data."
      render :new
    end

  end
  
end
