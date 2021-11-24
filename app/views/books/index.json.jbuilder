json.array!(Book.all) do |book|
  next if book.customer.nil?

  json.extract! book, :id
  json.start book.start_at
  json.end book.end_at
  book_date = book.start_at
  json.title book.customer.name+" 様"
  json.url book_url(book)
end