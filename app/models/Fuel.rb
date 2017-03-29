class Fuel < OpenStruct

  def self.find_elec(zip_code)
    DeveloperService.new.developer(zip_code)[:fuel_stations]#.map do |stations|
      #stations.map do |station|
        #Fuel.new(station)
      #end
    #end
  end
end
