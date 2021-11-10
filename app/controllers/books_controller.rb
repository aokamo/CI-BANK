class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
  end

private
  def book_params
    params.require(:book).permit()
end
