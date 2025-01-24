RSpec.describe GoldDerby::Award::Oscar do
	before do
		allow(GoldDerby::Prediction::CombinedOdd).to receive(:new)
	end
	
	describe 'initialize without passing in year argument' do
		let(:oscar) {GoldDerby::Award::Oscar.new}

		it 'should apply Time.current.year as the year' do
			expect(oscar.year).to eq(Time.current.year)
		end

		it 'should apply predictions with the correct end URL' do
			expect(
				GoldDerby::Prediction::CombinedOdd
			).to receive(:new).with("oscars-nominations-#{Time.current.year}-predictions")

			oscar
		end
	end

	describe 'initialize passing in year argument' do
		let(:year_argument) {2023}
		let(:oscar) {GoldDerby::Award::Oscar.new(year_argument)}

		it 'should apply the passed-in year argument as the year' do
			expect(oscar.year).to eq(year_argument)
		end

		it 'should apply predictions with the correct end URL' do
			expect(
				GoldDerby::Prediction::CombinedOdd
			).to receive(:new).with("oscars-nominations-#{year_argument}-predictions")

			oscar
		end
	end
end
