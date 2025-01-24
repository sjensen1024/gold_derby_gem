require 'active_support/all'
require "ostruct"

module GoldDerby
	module Award
		class Oscar
			attr_accessor :year, :predictions

			def initialize(year = Time.current.year)
				@year = year
				apply_predictions
			end

			private

			def apply_predictions
				@predictions = OpenStruct.new(
					with_combined_odds: GoldDerby::Prediction::CombinedOdd.new(section_url)
				)
			end

			def section_url
				"oscars-nominations-#{year}-predictions"
			end
		end
	end
end
