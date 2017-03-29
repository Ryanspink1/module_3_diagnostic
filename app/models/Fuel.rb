class Fuel < OpenStruct

  def find_elec
    DeveloperService.new.
