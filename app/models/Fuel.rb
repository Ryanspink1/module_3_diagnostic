class Fuel < OpenStruct

  def self.find_elec(zip_code)
    DeveloperService.new.developer(zip_code).map do |station|
      Fuel.new(station)
    end
  end
end
