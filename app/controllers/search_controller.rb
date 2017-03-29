class SearchController < ApplicationController

  def index
    @fuel_stations = Fuel.master(params[:q])
    # @electric_fuel = Fuel.find_elec(params[:q])
    # @prop_fuel = Fuel.find_prop(params[:q])
    byebug
  end



end
