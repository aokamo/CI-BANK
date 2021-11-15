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
      customer = Customer.new(phone_num: book_params[:phone_num],name: book_params[:name])
      if customer.save
        book = customer.books.new(people: book_params[:people], note: book_params[:note])
        @visit = book_params[:date] +" "+ book_params[:time]
        book.visit_time = @visit.to_datetime
        book.save
        redirect_to books_path
      end
    else
      redirect_to customers_path(phone_num:book_params[:phone_num], name: book_params[:name] )
    end
  end

private
  def book_params
    params.require(:book).permit(:phone_num, :name, :people, :allergy, :note, :date, :time )
  end
end
