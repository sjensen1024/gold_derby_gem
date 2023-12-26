RSpec.describe GoldDerby do
  it "has a version number" do
    expect(GoldDerby::VERSION).not_to be nil
  end

  it 'should have a MAIN_SITE_URL constant' do
  	expect(GoldDerby::MAIN_SITE_URL).to eq("https://www.goldderby.com")
  end
end
