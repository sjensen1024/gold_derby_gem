shared_examples 'a result set WITHOUT related_production data' do
	let(:results) { "Set this to to (a result set with a certain category).results" }
	let(:expected_first_result_nominee) {"ex: Everything Everywhere All at Once"}
	let(:expected_last_result_nominee) {"ex: Emergency"}

	it 'should have the expected nominee for the first result' do
		first_result = results.select{|i| i.rank == "1"}.first
		expect(first_result.nominee).to eq(expected_first_result_nominee)
	end

	it 'should have the expected nominee for the last result' do
		last_result = results.select{|i| i.rank == results.length.to_s}.first
		expect(last_result.nominee).to eq(expected_last_result_nominee)
	end

	it 'should not have related_production_data for any results' do
		expect(results.any?{|i| i.related_production.present?}).to be(false)
	end
end

shared_examples 'a result set with related_production data' do
	let(:results) { "Set this to to (a result set with a certain category).results" }
	let(:expected_first_result_nominee) {"ex: Daniel Kwan and Daniel Scheinert"}
	let(:expected_first_result_related_production) { "ex: Everything Everywhere All at Once" }
	let(:expected_last_result_nominee) {"ex: Alice Diop"}
	let(:expected_last_result_related_production) {"ex: Saint Omer"}

	it 'should have the expected nominee and related_production for the first result' do
		first_result = results.select{|i| i.rank == "1"}.first
		expect(first_result.nominee).to eq(expected_first_result_nominee)
		expect(first_result.related_production).to eq(expected_first_result_related_production)
	end

	it 'should have the expected nominee and related_production for the last result' do
		last_result = results.select{|i| i.rank == results.length.to_s}.first
		expect(last_result.nominee).to eq(expected_last_result_nominee)
		expect(last_result.related_production).to eq(expected_last_result_related_production)
	end

	it 'should have related_production data for all results' do
		expect(results.any?{|i| i.related_production.blank?}).to be(false)
	end
end