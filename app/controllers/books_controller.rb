class BooksController < ApplicationController
  before_action :authenticate_admin!

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    search_date = Date.today
    @books = Book.where(start_at: search_date.in_time_zone.all_day)
    @customer = Customer.new
    @customers = Customer.all
    @tablenumbers = Tablenumber.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if params.key?(:date) && params.key?(:time)
      @visit = book_params[:date] +" "+ book_params[:time]
      @book.start_at = @visit.to_datetime
    end

    if @book.update(book_params)
      redirect_to books_path, notice: "予約情報が更新されました"
    end
  end

  def create
    customer = Customer.find_by("phone_num=? or name=?",book_params[:phone_num],book_params[:name])
    if customer.blank?
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
      book = customer.books.new(people: book_params[:people], note: book_params[:note], allergy: book_params[:allergy], other_allergy: book_params[:other_allergy])
      @visit = book_params[:date] +" "+ book_params[:time]
      book.start_at = @visit.to_datetime
      if book.save
        redirect_to books_path
      else
        redirect_to customers_path(phone_num:book_params[:phone_num], name: book_params[:name] )
      end
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:phone_num, :name, :people, :allergy, :note, :date, :time, :other_allergy, :tablenumber_id)
  end
end
