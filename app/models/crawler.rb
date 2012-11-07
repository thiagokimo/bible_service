require 'nokogiri'
require 'open-uri'

class Crawler

	def get_books index_link, css_path, html_field

		result = Array.new

		html_index = Nokogiri::HTML(open(index_link))

		links = html_index.css(css_path)
		
		links.each do |anchor|
			result.push([anchor.content, anchor[html_field]])
		end

		return result
	end

end