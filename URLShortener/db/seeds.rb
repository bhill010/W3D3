# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(email: 'brandon@yahoo.com')
u2 = User.create!(email: 'harvey@yahoo.com')
u3 = User.create!(email: 'tommy@yahoo.com')
u4 = User.create!(email: 'jacee@yahoo.com')
u5 = User.create!(email: 'pumpkin@yahoo.com')


s1 = ShortenedUrl.create!(long_url: 'www.google.com', short_url: ShortenedUrl.random_code, user_id: u1.id)
s2 = ShortenedUrl.create!(long_url: 'www.youtube.com', short_url: ShortenedUrl.random_code, user_id: u2.id)

#Test unique visits
v1 = Visit.create!(visitor_id: 1, short_url_id: 1)
v2 = Visit.create!(visitor_id: 1, short_url_id: 1)
v3 = Visit.create!(visitor_id: 1, short_url_id: 1)
