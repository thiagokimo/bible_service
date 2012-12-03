#Bible Service
![pictureGallery](http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2011/2/11/1297427584196/Bible-007.jpg "bible")
=============

#Description
A RoR application that provides content from the bible. The content collected was the <b>Nova Versão Internacional</b> bible
in brazilian portuguese. It was scrapped from <a>http://www.bible.com/</a>.

##Setup

Assuming that you have Ruby, Rails and MySQL properly installed and configured in your machine:

1. <b>Clone this repository to your machine</b>:
  
  > `git clone https://github.com/thiagokimo/bible_service.git`

2. <b>Inside the project directory</b>:
  
  > `bundle install`

3. <b>Create and migrate the databases</b>:
  
  > `rake db:create`<br>
  > `rake db:migrate`

4. <b>In order to populate the database, run the following task</b>:
  
  > `rake bible:get_bible`<br>

##How it works
There are 3 main entities:

* Book - Stores the book's name and link.
* Chapter - Stores the chapter's number and link.
* Verse - Stores the verses' number and its content.

The application has a crawler that populates the database parsing each html page, scrapping the content related to each
entitie. All scrap processes were built as rake tasks and can be triggered anytime. More information in `lib/tasks/bible.com.rake`

The service exports the information as json by HTTP requests. All routes are nested as <i>Book</i>, <i>Chapter</i> and <i>Verse</i>
respectively. The regular expressions to retrieve each entitie information corresponds to its own rake route:

* <b>Book:</b> - "/books"
* <b>Chapter:</b> - "books/<b><i>book_id</i></b>/chapters"
* <b>Verse:</b> - "books/<b><i>book_id</i></b>/chapters/<b><i>chapter_id</i></b>/verses"

##Usage
To get the information, access the URL's according to its entitie.
Inside the project's folder, start the server with

  > `rails s`<br>

and try the following examples:

* <b>Whole bible:</b> - http://localhost:3000/books.json

* <b> All chapters from the book Exodus</b> - http://localhost:3000/books/2/chapters.json

* <b>All verses from the first chapter of Genesis:</b> - http://localhost:3000/books/1/chapters/1/verses.json

## Future ideas and "to do"s'

1. Create tasks to collect information from other bibles
2. Change from Rails to Sinatra because its lightier ;)
3. Separate the crawler as a GEM, which will allow us to integrate our bible in other frameworks.
4. Start writting the commit messages in English, LOL

##How to contribute
Please ensure that you provide appropriate test coverage and ensure the documentation is up-to-date. It is encouraged that you perform changes in a clean topic branch rather than a master and that you create a pull request for them. This will facilitate discussion and revision.

Please be clean, keep your commits atomic and with the smallest possible logical change. This will increase the likelihood of your submission to be used.

###Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug.

https://github.com/thiagokimo/bible_service/issues

##License
Copyright (c) 2012 Thiago Moreira Rocha.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to use, copy and modify copies of the Software, subject
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




