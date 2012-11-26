require 'nokogiri'
require 'open-uri'

namespace :bible do 
	desc "Coleta e grava no banco os livros coletados"
	task :get_bible => :environment do

		#Start URL
		#url = "https://www.bible.com/bible/129/gen.1.nvi"
		flag = true;
		url = "https://www.bible.com/bible/129/sng.8.13.nvi"

		html = Nokogiri::HTML(open(url))

		next_url = ''

		while next_url

			if first_time? flag
				main_info_area = html.css('[data-book-human]')
				flag = false
			else
				html = Nokogiri::HTML(open("https://www.bible.com" << next_url))
				main_info_area = html.css('[data-book-human]')
			end

			#get book name and chapter number
			name = main_info_area[0].attr('data-book-human')
			chapter = main_info_area[0].attr('data-chapter')

			book = Book.find_or_create_by_name(name)
			chapter = book.chapters.find_or_create_by_number(chapter)

			#get verse area
			verses_area = main_info_area.css(".chapter .verse")

			verses_area.each do |element|
				verse = ""
				verse_number = ""
				
				if element.css('.label') != '#'
					verse = element.css('.content').text

					#remove foot notes
					verse_number = element.css('.label').text.gsub(/\#/i, "")
					
					if verse.blank? == false && verse_number.blank? == false
						puts verse_number << " " << verse
						chapter.verses.find_or_create_by_content_and_number(verse, verse_number)
					end
				end			
			end

			next_url = html.css('.nav_next').attr('href').value
		end

		
	end

	def first_time? flag
		return flag
	end

end