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
    @books = @customer.book.all
  end

  def index
    @course = Course.new
    if params[:name]
      @customers = Customer.where("phone_num=? or name=?",params[:phone_num],params[:name])
    else
      @customers = Customer.all
    end
  end

  def search
    @customers = Customer.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

private

  def customer_params
    params.permit(:name, :phone_num, :address, :allergy, :note, :is_active, :age, :book_id)
  end

end
