json.array!(Book.all) do |book|
  next if book.customer.nil?

  json.extract! book, :id
  json.start book.start_at
  json.end book.end_at
  if book.people.present?
    json.title book.customer.name+" 様 " + book.people+"人"
  else
    json.title book.customer.name+" 様 "
  end
  json.url book_url(book)
end