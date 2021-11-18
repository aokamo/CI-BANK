json.array!(Book.all) do |book|
  json.extract! book, :id
  json.start book.start_at
  json.end book.end_at
  book_date = book.start_at.to_date
  json.title book.customer.name
  json.url book_url(book)
end