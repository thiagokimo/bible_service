require "./app"
require "sinatra/activerecord/rake"
require './crawler'

namespace :crawler do
  desc "Get and store collected books from web"
  task :get_books do

    url = "http://www.bibliaonline.com.br/nvi"
    css_path = ".c a"
    html_field = :href

    #url = "http://www.biblegateway.com/versions/New-International-Version-NIV-Bible/"
    #css_path = ".chapterlinks td:nth-child(1)"

    crawler = Crawler.new

    livros = crawler.get_books url, css_path, html_field

    livros.each do |livro|
      puts livro[0]
      Book.find_or_create_by_title(livro[0])
    end
  end
end
