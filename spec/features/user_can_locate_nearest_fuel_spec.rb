require "rails_helper"

featuer "User sees a list of nearest fuel stations" do
  context "upon searching with a zip code" do
    it "returns a list of fuel stations" do
      VCR.use_cassette("user_sees_fuel", :record => :new_episodes) do
        visit "/"

        fill_in "/search", with: 80203

        click_on "Locate"
        expect(current_path).to eq("/search")
        expect(current_url).to include("zip=80203")
        expect(current_url).to include("fuel_type=ELEC,LPG")
        expect(current_url).to include("distance=6")
        expect(page).to have_content("10 stations")
        expect(page).to have_css(".station", count: 10)

        within(first(".station")) do
          expect(page).to have_css(".name")
          expect(page).to have_content("")
          expect(page).to have_css(".address")
          expect(page).to have_content("")
          expect(page).to have_css(".fuel_types")
          expect(page).to have_content("")
          expect(page).to have_css(".distance")
          expect(page).to have_content("")
          expect(page).to have_css(".access_times")
          expect(page).to have_content("")
        end
      end
    end
  end
end
