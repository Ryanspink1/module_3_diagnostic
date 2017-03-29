class Fuel < OpenStruct

  def self.find_elec(zip_code)
    DeveloperService.new.developer(zip_code)[:fuel_stations]#.map do |stations|
      #stations.map do |station|
        #Fuel.new(station)
      #end
    #end
  end

  def self.find_prop(zip_code)
    DeveloperService.new.developer_propane(zip_code)[:fuel_stations]
  end


  def self.master(zip_code)
    electric = Fuel.find_elec(zip_code)
    propane = Fuel.find_prop(zip_code)
    total = electric + propane
    sorted = total.sort_by do |station|
      station[:distance]
    end
    sorted[0..9]
  end
end
