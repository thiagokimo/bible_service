require 'nokogiri'
require 'open-uri'
require 'zlib'

class Crawler

	def get_books index_link, css_path, html_field

		result = Array.new

		stream = open(index_link)

		if (stream.content_encoding.empty?)
  			body = stream.read
		else
  			body = Zlib::GzipReader.new(stream).read
		end

		html_index = Nokogiri::HTML(body)

		links = html_index.css(css_path)
		
		links.each do |anchor|
			result.push([anchor.content, anchor[html_field]])
		end

		result
	end

	def get_chapters book_link, css_path, html_field
		#usa a mesma lógica do get_books
		get_books book_link, css_path, html_field
		
	end

	def get_verses chapter_link, css_path, html_field
		#usa a mesma lógica do get_books
		get_books chapter_link, css_path, html_field
	end

end