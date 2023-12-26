RSpec.describe GoldDerby::Prediction::CombinedOdd do

	let(:category_section_of_url) {"oscars-nominations-2024-predictions"}
	let(:combined_odd) {GoldDerby::Prediction::CombinedOdd.new(category_section_of_url)}
	let(:expected_site_url) {"#{GoldDerby::MAIN_SITE_URL}/odds/combined-odds/oscars-nominations-2024-predictions"}


	before do
		allow(GoldDerby::Prediction::CategoryResultSet).to receive(:new)
		allow(HTTParty).to receive(:get).with(expected_site_url).and_return(
			File.read('spec/support/oscar_combined_odds_predictions_sample.html')
		)
	end

	
	it 'should set the site URL correctly' do
		expect(combined_odd.site_url).to eq(expected_site_url)
	end

	it 'should create new category result sets' do
		expect(combined_odd.result_sets).not_to be_empty
	end
end
