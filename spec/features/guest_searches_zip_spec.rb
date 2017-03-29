require 'rails_helper'

feature 'when a guests searches a zip code' do
  scenario 'they are given a list of the 10 closest fuel stations' do
    VCR.use_cassette('features/search_by_zip') do
      visit root_path

        fill_in("q", :with => '80203')
        click_button("Locate")

      expect(current_path).to eq("/search")

      expect(page).to have_content("UDR")
      expect(page).to have_content("City of Denver - Cultural Center Complex Garage")
      expect(page).to have_content("JOULE")
      expect(page).to have_content("CADACHARGEPOINT")
      expect(page).to have_content("PUBLIC STATIONS")
      expect(page).to have_content("City of Denver - Denver Justice Center Garage")
      expect(page).to have_content("Wells Fargo Center")
      expect(page).to have_content("Tremont Street Garage")
      expect(page).to_not have_content("Alabaster")
    end
  end
end
