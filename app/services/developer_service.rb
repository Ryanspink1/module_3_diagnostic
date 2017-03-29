class DeveloperService

  def initialize
    @connection = Faraday.new("https://api.data.gov/")
    @secret     = "nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{open(lib/assets/.secret_key).read.gsub("\n","")}&fuel_type=ELEC&zip=80203&limit=10"
  end

  def developer(zip_code)
    parse(connection.get("nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{open(lib/assets/.secret_key).read.gsub("\n","")}&fuel_type=ELEC&zip=#{zip_code}&limit=10")
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
