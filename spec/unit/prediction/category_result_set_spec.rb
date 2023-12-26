RSpec.describe GoldDerby::Prediction::CategoryResultSet do

	let(:sample_site_html) do
		Nokogiri::HTML.parse( File.read('spec/support/oscar_combined_odds_predictions_sample.html') )
	end
	let(:predictions_wrapper_html) do
		sample_site_html.css('div.predicted-winners').css('div.predictions-wrapper')
	end


	context 'category without production info' do
		let(:category_html) {predictions_wrapper_html.first}
		let(:category_result_set) {GoldDerby::Prediction::CategoryResultSet.new(category_html)}

		it 'should set the category' do
			expect(category_result_set.category).to eq("Best Picture")
		end

		it 'should have results with non-nil rank and nominee, nil related_production' do
			expect(category_result_set.results).to include(
				OpenStruct.new(rank: "1", nominee: "Oppenheimer", related_production: nil)
			)
			expect(category_result_set.results).to include(
				OpenStruct.new(rank: "74", nominee: "Memory", related_production: nil)
			)
		end
	end

	context 'category with related production info' do
		let(:category_html) {predictions_wrapper_html[1]}
		let(:category_result_set) {GoldDerby::Prediction::CategoryResultSet.new(category_html)}

		it 'should set the category' do
			expect(category_result_set.category).to eq("Best Director")
		end

		it 'should have results with non-nil rank, nominee, and related production' do
			expect(category_result_set.results).to include(
				OpenStruct.new(rank: "1", nominee: "Christopher Nolan", related_production: "Oppenheimer")
			)
			expect(category_result_set.results).to include(
				OpenStruct.new(rank: "69", nominee: "Michel Franco", related_production: "Memory")
			)
		end
	end
end
