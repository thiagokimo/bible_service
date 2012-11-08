#Bible Service
![pictureGallery](http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2011/2/11/1297427584196/Bible-007.jpg "bible")
=============

#Description
A RoR application that provides content from the bible. The content collected was the <b>Nova Versão Internacional</b> bible
in brazilian portuguese. It was scrapped from <a>http://www.bibliaonline.com.br/</a>.

##Setup

Assuming that you have Ruby, Rails and MySQL properly installed and configured in your machine:

1. <b>Clone this repository to your machine</b>:
  
  > `git clone https://github.com/thiagokimo/bible_service.git`

2. <b>Inside the project directory</b>:
  
  > `bundle install`

3. <b>Create and migrate the databases</b>:
  
  > `rake db:create`<br>
  > `rake db:migrate`

4. <b>Run the crawler tasks to populate the databases</b>:
  
  > `rake bibliaonline:pega_livros`<br>
  > `rake bibliaonline:pega_capitulos`<br>
  > `rake bibliaonline:pega_versiculos`

##How it works
There are 3 main entities:

* Book - Stores the book's name and link.
* Chapter - Stores the chapter's number and link.
* Verse - Stores the verses' number and its content.

The application has a crawler that populates the database parsing each html page, scrapping the content related to each
entitie. All scrap processes were built as rake tasks and can be triggered anytime. More information in `lib/tasks/bibliaonline.rake`

The service exports the information as json by HTTP requests. All routes are nested as <i>Book</i>, <i>Chapter</i> and <i>Verse</i>
respectively. The regular expressions to retrieve each entitie information corresponds to its own rake route:

* <b>Book:</b> - "/books"
* <b>Chapter:</b> - "books/<b><i>book_id</i></b>/chapters"
* <b>Verse:</b> - "books/<b><i>book_id</i></b>/chapters/<b><i>chapter_id</i></b>/verses"

##Usage
To get the information, access the URL's according to its entitie.

Examples:

* <b>All books:</b> - http://localhost:3000/books.json

* <b> All chapters from the book Exodus</b> - http://localhost:3000/books/2/chapters.json

* <b>All verses from the first chapter of Genesis:</b> - http://localhost:3000/books/1/chapters/1/verses.json

## Future ideas and "to do"s'

1. Create tasks to collect information from other bibles  
2. BibliaOnline.com has no consistency data. Find another source that has!
3. Change from Rails to Sinatra because its lightier ;)
4. Separate the crawler as a GEM, which will allow us to integrate our bible in other frameworks.
5. Start writting the commit messages in English, LOL

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request






