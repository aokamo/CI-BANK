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
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice: "顧客情報が更新されました"
    else
      render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @books = @customer.books
  end

  def index
    @customer = Customer.new
    @course = Course.new
    @book = Book.new
    if params[:customer_id].present?
      customer = Customer.find(params[:customer_id])
      @book.name = customer.name
      @book.customer = customer
      @book.customer.phone_num = customer.phone_num
      @book.allergy = customer.allergy
    end

    if params[:name].present?
      @serch_result = Customer.where("phone_num=? or name=?",params[:phone_num],params[:name])
    elsif params[:keyword].present?
      @serch_result = Customer.search(params[:keyword])
      @keyword = params[:keyword]
    else
      @serch_result = Customer.all
    end
    @customers = Customer.all.page(params[:page]).per(15)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path, notice: "顧客情報は削除されました"
  end


private

  def customer_params
    params.require(:customer).permit(:name, :phone_num, :address, :allergy, :note, :is_active, :age, :book_id)
  end

end
