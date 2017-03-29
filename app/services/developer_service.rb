class DeveloperService

  def initialize
    @connection = Faraday.new("https://api.data.gov/")
    @secret     = open('lib/assets/.secret_key').read.gsub("\n","")
  end

  def developer(zip_code)
    parse(@connection.get("nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{@secret}&fuel_type=ELEC&zip=#{zip_code}&limit=10"))
    # byebug
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
