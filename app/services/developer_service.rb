class DeveloperService

  def initialize
    @connection = Faraday.new("https://api.data.gov/")
    @secret     = "nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{open(lib/assets/.secret_key).read.gsub("\n","")}"
  end

  def developer
    parse(connection.get("#{secret}"))
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
