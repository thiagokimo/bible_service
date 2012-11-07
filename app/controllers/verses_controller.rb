class VersesController < ApplicationController

  before_filter :load_book_and_chapter

  # GET /verses
  # GET /verses.json
  def index
    @verses = @chapter.verses

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verses }
    end
  end

  # GET /verses/1
  # GET /verses/1.json
  def show
    @verse = Verse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verse }
    end
  end

  protected
  def load_book_and_chapter
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.find(params[:chapter_id])
  end

end
