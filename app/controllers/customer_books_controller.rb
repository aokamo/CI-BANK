class CustomerBooksController < ApplicationController

private
  customer_books_params
  params.require(:customer_books).permit(:customer_id, :book_id)
end
