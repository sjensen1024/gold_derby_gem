RSpec.describe GoldDerby::Award::Oscar do
	describe 'real site parsing using previous year (i.e., no chance of the predicted nominees changing)' do
		let!(:year) {2023}  
		let!(:historical_oscar) {GoldDerby::Award::Oscar.new(year)}
		let!(:combined_odds_result_sets) {historical_oscar.predictions.with_combined_odds.result_sets}

		it 'should set Oscar year to year argument' do
			expect(historical_oscar.year).to be(2023)
		end

		context 'Best Picture' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Picture" }.first.results}
				let(:expected_first_result_nominee) {"Everything Everywhere All at Once"}
				let(:expected_last_result_nominee) {"Emergency"}
			end
		end

		context 'Best Director' do
			it_behaves_like 'a result set with related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Director" }.first.results}
				let(:expected_first_result_nominee) {"Daniel Kwan and Daniel Scheinert"}
				let(:expected_first_result_related_production) { "Everything Everywhere All at Once" }
				let(:expected_last_result_nominee) {"Alice Diop"}
				let(:expected_last_result_related_production) {"Saint Omer"}
			end
		end

		context 'Best Actress' do
			it_behaves_like 'a result set with related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Actress" }.first.results}
				let(:expected_first_result_nominee) {"Cate Blanchett"}
				let(:expected_first_result_related_production) { "TAR" }
				let(:expected_last_result_nominee) {"Tilda Swinton"}
				let(:expected_last_result_related_production) {"The Eternal Daughter"}
			end
		end

		context 'Best Actor' do
			it_behaves_like 'a result set with related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Actor" }.first.results}
				let(:expected_first_result_nominee) {"Brendan Fraser"}
				let(:expected_first_result_related_production) { "The Whale" }
				let(:expected_last_result_nominee) {"Daryl McCormack"}
				let(:expected_last_result_related_production) {"Good Luck to You, Leo Grande"}
			end
		end

		context 'Best Supporting Actress' do
			it_behaves_like 'a result set with related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Supporting Actress" }.first.results}
				let(:expected_first_result_nominee) {"Angela Bassett"}
				let(:expected_first_result_related_production) { "Black Panther: Wakanda Forever" }
				let(:expected_last_result_nominee) {"Emma Thompson"}
				let(:expected_last_result_related_production) {"Matilda"}
			end
		end

		context 'Best Supporting Actor' do
			it_behaves_like 'a result set with related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Supporting Actor" }.first.results}
				let(:expected_first_result_nominee) {"Ke Huy Quan"}
				let(:expected_first_result_related_production) { "Everything Everywhere All at Once" }
				let(:expected_last_result_nominee) {"Nicholas Hoult"}
				let(:expected_last_result_related_production) {"The Menu"}
			end
		end

		context 'Best Adapted Screenplay' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Adapted Screenplay" }.first.results}
				let(:expected_first_result_nominee) {"Women Talking"}
				let(:expected_last_result_nominee) {"EO"}
			end
		end

		context 'Best Original Screenplay' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Original Screenplay" }.first.results}
				let(:expected_first_result_nominee) {"Everything Everywhere All at Once"}
				let(:expected_last_result_nominee) {"The Unbearable Weight of Massive Talent"}
			end
		end

		context 'Best Cinematography' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Cinematography" }.first.results}
				let(:expected_first_result_nominee) {"Top Gun: Maverick"}
				let(:expected_last_result_nominee) {"Where the Crawdads Sing"}
			end
		end

		context 'Best Costume Design' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Costume Design" }.first.results}
				let(:expected_first_result_nominee) {"Black Panther: Wakanda Forever"}
				let(:expected_last_result_nominee) {"Where the Crawdads Sing"}
			end
		end

		context 'Best Film Editing' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Film Editing" }.first.results}
				let(:expected_first_result_nominee) {"Top Gun: Maverick"}
				let(:expected_last_result_nominee) {"Moonage Daydream"}
			end
		end

		context 'Best Makeup and Hairstyling' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Makeup and Hairstyling" }.first.results}
				let(:expected_first_result_nominee) {"The Whale"}
				let(:expected_last_result_nominee) {"Emancipation"}
			end
		end

		context 'Best Production Design' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Production Design" }.first.results}
				let(:expected_first_result_nominee) {"Babylon"}
				let(:expected_last_result_nominee) {"Where the Crawdads Sing"}
			end
		end

		context 'Best Score' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Score" }.first.results}
				let(:expected_first_result_nominee) {"Babylon"}
				let(:expected_last_result_nominee) {"Devotion"}
			end
		end

		context 'Best Song' do
			it_behaves_like 'a result set with related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Song" }.first.results}
				let(:expected_first_result_nominee) {"RRR"}
				let(:expected_first_result_related_production) { "Naatu Naatu" }
				let(:expected_last_result_nominee) {"Amsterdam"}
				let(:expected_last_result_related_production) {"Time"}
			end
		end

		context 'Best Sound' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Sound" }.first.results}
				let(:expected_first_result_nominee) {"Top Gun: Maverick"}
				let(:expected_last_result_nominee) {"Moonage Daydream"}
			end
		end

		context 'Best Visual Effects' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Visual Effects" }.first.results}
				let(:expected_first_result_nominee) {"Avatar: The Way of Water"}
				let(:expected_last_result_nominee) {"Fantastic Beasts: The Secrets of Dumbledore"}
			end
		end

		context 'Best Animated Feature' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Animated Feature" }.first.results}
				let(:expected_first_result_nominee) {"Guillermo del Toro's Pinocchio"}
				let(:expected_last_result_nominee) {"Run, Tiger Run"}
			end
		end

		context 'Best Documentary Feature' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Documentary Feature" }.first.results}
				let(:expected_first_result_nominee) {"All the Beauty and the Bloodshed"}
				let(:expected_last_result_nominee) {"Hidden Letters"}
			end
		end

		context 'Best International Film' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best International Film" }.first.results}
				let(:expected_first_result_nominee) {"All Quiet on the Western Front"}
				let(:expected_last_result_nominee) {"Cairo Conspiracy"}
			end
		end

		context 'Best Animated Short' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Animated Short" }.first.results}
				let(:expected_first_result_nominee) {"The Boy, the Mole, the Fox and the Horse"}
				let(:expected_last_result_nominee) {"Passenger"}
			end
		end

		context 'Best Documentary Short' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Documentary Short" }.first.results}
				let(:expected_first_result_nominee) {"The Flagmakers"}
				let(:expected_last_result_nominee) {"Happiness Is £4 Million"}
			end
		end

		context 'Best Live Action Short' do
			it_behaves_like 'a result set WITHOUT related_production data' do
				let(:results) {combined_odds_result_sets.select{ |i| i.category == "Best Live Action Short" }.first.results}
				let(:expected_first_result_nominee) {"Le Pupille"}
				let(:expected_last_result_nominee) {"All in Favor"}
			end
		end
	end 
end