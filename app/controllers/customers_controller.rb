class CustomersController < ApplicationController
  before_action :authenticate_admin!

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@cusromer)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @course = Course.new

    @book = Book.new

    if params[:customer_id].present?
      customer = Customer.find(params[:customer_id])
      @book.name = customer.name
      @book.customer = customer
      @book.customer.phone_num = customer.phone_num
      @book.allergy = customer.allergy
    end

    if params[:name]
      @customers = Customer.where("phone_num=? or name=?",params[:phone_num],params[:name])
    elsif params[:keyword]
      @customers = Customer.search(params[:keyword])
      @keyword = params[:keyword]
    else
      @customers = Customer.all
    end
  end


private

  def customer_params
    params.permit(:name, :phone_num, :address, :allergy, :note, :is_active, :age, :book_id)
  end

end
