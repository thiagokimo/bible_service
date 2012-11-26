require 'nokogiri'
require 'open-uri'

namespace :bible do 
	desc "Coleta e grava no banco os livros coletados"
	task :get_books => :environment do
		url = "https://www.bible.com/bible/129/gen.1.nvi"

		html = Nokogiri::HTML(open(url))

		content_area = html.css(".chapter .verse")

		content_area.each do |element|
			verse = ""
			number = ""
			
			if element.css('.label') != '#'
				verse = element.css('.content').text
				number = element.css('.label').text.gsub(/\#/i, "")
				
				if verse.blank? == false && number.blank? == false
					puts number << " " << verse
				end
			end			
		end
	end
end