class SearchController < ApplicationController

  def index
    @fuel_stations = Fuel.master(params[:q])
  end
end
