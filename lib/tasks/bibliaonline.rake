namespace :bibliaonline do
  desc "Coleta e grava no banco os livros coletados"
  task :pega_livros => :environment do
  	url = "http://www.bibliaonline.com.br/nvi/"
  	css_path = "#footer a"

  	crawler = Crawler.new

  	livros = crawler.get_books url, css_path, :href

  	livros.each do |livro|
      puts livro
  		Book.find_or_create_by_name_and_link(livro[0],livro[1])
  	end

  end

  desc "Coleta e grava no banco os capitulos dos livros"
  task :pega_capitulos => :environment do
    livros = Book.all

    crawler = Crawler.new

    livros.each do |livro|
      
      css_path = ".chapter_index a"
      capitulos = crawler.get_chapters livro.link, css_path, :href

      capitulos.each do |capitulo|
        puts capitulo[0]
        livro.chapters.find_or_create_by_name_and_link capitulo[0].to_i, capitulo[1]  
      end

    end
  end

end
