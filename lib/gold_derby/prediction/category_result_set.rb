require "ostruct"

module GoldDerby
	module Prediction
		class CategoryResultSet

			attr_accessor :category, :results

			def initialize(category_html)
				@category_html = category_html
				process
			end

			private

			def process
				apply_category
				apply_results
			end

			def apply_category
				@category = @category_html.css('div.category-title').children.first.text.strip
			end

			def apply_results
				@results = parse_results_from_list_items
			end

			def parse_results_from_list_items
				category_list_items.map do |list_item|
					OpenStruct.new(
						rank: parse_list_item_rank(list_item),
						nominee: parse_list_item_nominee(list_item),
						related_production: parse_list_item_related_production(list_item)
					)
				end
			end

			def category_list_items
				@category_html.css('ul.predictions-list').css('li')
			end

			def parse_list_item_rank(list_item)
				extract_text_from_element(
					select_list_item_and_css_text(list_item, 'div.predictions-position-v2').first
				)
			end

			def parse_list_item_nominee(list_item)
				extract_text_from_element(
					select_list_item_and_css_text(list_item, 'div.predictions-name').first
				)
			end

			def parse_list_item_related_production(list_item)
				list_item_text_set = select_list_item_and_css_text(list_item, 'div.predictions-name')
				return extract_text_from_element(list_item_text_set[1]) unless list_item_text_set.size == 1
				nil
			end

			def select_list_item_and_css_text(list_item, css)
				list_item.css(css).children.select{ |i| i.text.present? }
			end

			def extract_text_from_element(element)
				element.text.strip
			end
		end
	end
end