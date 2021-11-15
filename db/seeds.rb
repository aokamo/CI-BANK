# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
 email: '1234567@gmail.com',
 password: '1234567'
)

Customer.create!(
 name: '岡本篤志',
 phone_num: '01012341234',
 address: '滋賀県大津市御陵町３−１',
 allergy: 'メロン',
 note: '誕生日は2,000年1月1日',
 age: '21'
)

Course.create!(
 name: 'Aコース'
)

Course.create!(
 name: 'Bコース'
)

Usage.create!(
 name: '女子会'
)

Usage.create!(
 name: '誕生会'
)

Usage.create!(
 name: '家族会'
)