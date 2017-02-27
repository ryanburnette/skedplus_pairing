require "rb_skedplus/pairing"

RSpec.describe RbSkedplus::Pairing do
  before :all do
    file_path = "spec/data/7050924_20161225_F404PC.txt"
    @file_contents = File.open(file_path).read
    @pairing = RbSkedplus::Pairing.new(@file_contents)
    @pairing_from_file_contents = @pairing
    @pairing_from_file_path = RbSkedplus::Pairing.new_from_file_path(file_path)
  end

  context "instantiates" do
    it "from file contents" do
      expect(@pairing_from_file_contents.contents).to eq(@file_contents)
    end

    it "from a file path" do
      expect(@pairing_from_file_path.contents).to eq(@file_contents)
    end
  end

  it "returns the lines" do
    expect(@pairing.lines).to eq(@file_contents.split("\r\n"))
  end

  it "crewmember number" do
    expect(@pairing.crewmember_number).to eq("7050924")
  end

  it "crewmember first name" do
    expect(@pairing.crewmember_first_name).to eq("Ryan")
  end

  it "crewmember last name" do
    expect(@pairing.crewmember_last_name).to eq("Burnette")
  end

  it "crewmember name" do
    expect(@pairing.crewmember_name).to eq("Ryan Burnette")
  end

  it "#crewmember_base" do
    expect(@pairing.crewmember_base).to eq("ATL")
  end

  it "#crewmember_aircraft" do
    expect(@pairing.crewmember_aircraft).to eq("CRJ")
  end

  it "#crewmember_position" do
    expect(@pairing.crewmember_position).to eq("FO")
  end

  it "#id" do
    expect(@pairing.id).to eq("F404PC")
  end

  it "#date" do
    expect(@pairing.date).to be_a(Date)
    expect(@pairing.date.to_s).to eq("2016-12-25")
  end

  it "#block_time" do
    expect(@pairing.block_time).to eq("18:39")
  end

  it "#credit_time" do
    expect(@pairing.credit_time).to eq("22:04")
  end

  it "#tafb_time" do
    expect(@pairing.tafb_time).to eq("79:11")
  end
end