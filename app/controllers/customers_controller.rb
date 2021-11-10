class CustomersController < ApplicationController
  before_action :authenticate_admin!

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to request.referer
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
    @customers = Customer.all
  end

  def search
    @customers = Customer.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

private

  def customer_params
    params.require(:customer).permit(:name, :phone_num, :address, :allergy, :note, :is_active, :age, :book_id)
  end

end
