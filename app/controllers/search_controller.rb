class SearchController < ApplicationController

  def index
    @electric_fuel = Fuel.find_elec(params[:q])
    byebug
  end



end
