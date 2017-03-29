require 'rails_helper'

describe "Fuel" do
  describe '#master' do
    it 'returns the closest 10 LPG and electric fuel stations within a 6 mile radius of a given zip code' do
      # VCR.use_cassette('services/master')
        fuel_stations = Fuel.master(80203)
        first = fuel_stations.first
        last  = fuel_stations.last

        expect(fuel_stations.count).to eq(10)
        expect(fuel_stations.count).to_not eq(9)

        expect(first[:station_name]).to eq("UDR")
        expect(first[:station_name]).to_not eq("City of Denver - Cultural Center Complex Garage")

        expect(last[:station_name]).to eq("Tremont Street Garage")
        expect(last[:station_name]).to_not eq("City of Denver - Cultural Center Complex Garage")
      # end
    end
  end
end
