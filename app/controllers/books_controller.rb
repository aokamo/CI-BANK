class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
  end

  def search
    @customers = Book.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def index
    @customer = Customer.where(visit_time ="today")
    @customers = @customer.all
  end

private
  def book_params
    params.require(:book).permit()
  end
end
