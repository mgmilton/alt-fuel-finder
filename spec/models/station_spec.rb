require "rails_helper"

describe Station do
  let(:attributes) {{
    name: "UDR",
    street_address: "800 Acoma St",
    fuel_type_codes: "ELEC",
    distance: "0.31422",
    access_days_time: "24 hours daily" }}

  subject {Station.new(attributes)}
  it "exists" do
    expect(subject).to be_a Station
  end

  it "sets the required attributes" do
    expect(subject.name).to eq("UDR")
    expect(subject.address).to eq("800 Acoma St")
    expect(subject.fuel_types).to eq("ELEC")
    expect(subject.distance).to eq("0.31422")
    expect(subject.access_times).to eq("24 hours daily")
  end
end
