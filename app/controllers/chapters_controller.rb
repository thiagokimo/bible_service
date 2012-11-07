class ChaptersController < ApplicationController
   before_filter :load_book

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = @book.chapters

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chapters }
    end
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chapter }
    end
  end


  protected
  def load_manga
    @book = Book.find(params[:book_id])
  end
end
