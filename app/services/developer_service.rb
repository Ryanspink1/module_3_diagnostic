class DeveloperService

  def initialize
    @connection = Faraday.new("https://api.data.gov/")
    @secret     = open('lib/assets/.secret_key').read.gsub("\n","")
  end

  def developer(zip_code)
    # parse(@connection.get("nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{@secret}&fuel_type=ELEC&zip=#{zip_code}&limit=10"))
    parse(@connection.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{@secret}&location=#{zip_code}&fuel_type=ELEC&radius=6&limit=10"))
  end

  def developer_propane(zip_code)
      parse(@connection.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{@secret}&location=#{zip_code}&fuel_type=LPG&radius=6&limit=10"))
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
