class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @books = Book.new
  end

  def create
    Book.create!(book_params)
    redirect_to books_url
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
