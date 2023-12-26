require "httparty"
require "nokogiri"
require "active_support/all"

module GoldDerby
	module Prediction
		class CombinedOdd
			attr_accessor :site_url, :result_sets

			URL_FRAGMENT = "/odds/combined-odds/"

			def initialize(category_section_of_url)
				@category_section_of_url = category_section_of_url
				process
			end

			private

			def process
				apply_site_url
				apply_result_sets
			end

			def apply_site_url
				@site_url = GoldDerby::MAIN_SITE_URL + URL_FRAGMENT + @category_section_of_url
			end

			def apply_result_sets
				@result_sets = prediction_sections_from_site.map do |category_html| 
					GoldDerby::Prediction::CategoryResultSet.new(category_html)
				end
			end

			def prediction_sections_from_site
				site_predicted_winners = site_response_body.css('div.predicted-winners')
				site_predicted_winners.css('div.predictions-wrapper')
			end

			def site_response_body
				Nokogiri::HTML.parse( HTTParty.get(@site_url) )
			end
		end
	end
end
