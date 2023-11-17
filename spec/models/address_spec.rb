require 'rails_helper'

RSpec.describe Address, type: :model do
  it "is not valid without these five things" do 
    address = Address.create(
      street_number: 125,
      street_name: 'elmos world',
      city: 'sesame street',
      state: 'Denver',
      zip: 23132
    )
    expect(address).to be_valid
  end
end
