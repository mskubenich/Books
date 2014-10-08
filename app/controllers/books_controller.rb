class BooksController < ApplicationController

  load_and_authorize_resource

  def index
  	@books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to @book, notice: 'New book succesfully added!'
    else
      render 'new'
    end
  end

  def show

  end

  private

  def book_params
    params.require(:book).permit(:title, :description)
  end

end
