namespace :bibliaonline do
  desc "Coleta grava no banco os livros coletados"
  task :pega_livros => :environment do
  	url = "http://www.bibliaonline.com.br/nvi/"
  	css_path = "#footer a"
  	html_field = :href

  	crawler = Crawler.new

  	livros = crawler.get_livros url, css_path, html_field

  	livros.each do |livro|
  		puts livro
  	end

  end

end
