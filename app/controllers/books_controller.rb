class BooksController < ApplicationController
  before_action :authenticate_admin!

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @customer = Customer.new
    @customers = Customer.all
  end

  def create
    customers = Customer.where("phone_num=? or name=?",book_params[:phone_num],book_params[:name])
    if customers.empty?
      customer = Customer.new(phone_num: book_params[:phone_num],name: book_params[:name], allergy: book_params[:allergy])
      if customer.save
        book = customer.books.new(people: book_params[:people], note: book_params[:note], allergy: book_params[:allergy], other_allergy: book_params[:other_allergy])
        @visit = book_params[:date] +" "+ book_params[:time]
        book.start_at = @visit.to_datetime
        book.save
        redirect_to books_path
      else
        render index
      end
    else
      redirect_to customers_path(phone_num:book_params[:phone_num], name: book_params[:name] )
    end
  end

  def show
    @book = Book.find(params[:id])
  end

private
  def book_params
    params.require(:book).permit(:phone_num, :name, :people, :allergy, :note, :date, :time, :other_allergy )
  end
end
