require 'rails_helper'

describe 'Mechanics show page' do
  before do
    @amusement_park_1 = AmusementPark.create!(
      name: "Lincoln Log Land",
      admission_cost: 658
    )
    @amusement_park_2 = AmusementPark.create!(
      name: "Gloveworld",
      admission_cost: 4
    )

    @ride_1 = @amusement_park_1.rides.create!(
      name: "Actual Log Cabin",
      thrill_rating: 1,
      open: true
    )
    @ride_2 = @amusement_park_1.rides.create!(
      name: "Space Log Roller Coaster",
      thrill_rating: 9,
      open: false
    )
    @ride_3 = @amusement_park_1.rides.create!(
      name: "Lincoln Log Slide",
      thrill_rating: 4,
      open: true
    )
    @ride_4 = @amusement_park_2.rides.create!(
      name: "Glove Ferris Wheel",
      thrill_rating: 2,
      open: true
    )
    @ride_5 = @amusement_park_2.rides.create!(
      name: "Glovinator",
      thrill_rating: 10,
      open: true
    )

    visit "/amusement_parks/#{@amusement_park_1.id}"
  end

  it 'displays name and cost of admission' do
    expect(page).to have_content("Lincoln Log Land")
    expect(page).to have_content("Admission: $658")
  end
end
