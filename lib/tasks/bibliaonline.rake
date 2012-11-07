namespace :bibliaonline do
  desc "Coleta grava no banco os livros coletados"
  task :pega_livros => :environment do
  	url = "http://www.bibliaonline.com.br/nvi/"
  	css_path = "#footer a"
  	html_field = :href

  	crawler = Crawler.new

  	livros = crawler.get_books url, css_path, html_field

  	livros.each do |livro|
      puts livro
  		Book.find_or_create_by_name_and_link(livro[0],livro[1])
  	end

  end

end
