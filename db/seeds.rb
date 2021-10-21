City.delete_all
User.delete_all
Listing.delete_all
# Reservation.delete_all

zip_codes = ["67000", "68400", "68170", "06500", "68150", "68125", "68300", "67500", "57000", "54000"]
city_names = ["Strasbourg", "Riedisheim", "Rixheim", "Menton", "Ribeauvillé", "Colmar", "Saint-Louis", "Haguenau", "Metz", "Nancy"]
10.times do |i|
  City.create!(
    name: city_names[i],
    zip_code: zip_codes[i]
  )
end
puts "10 Cities created!"


20.times do |i|
  User.create!(
    email: Faker::Internet.email,
    phone_number: "0" + rand(600000000..799999999).to_s,
    description: Faker::Hipster.paragraph(sentence_count: 2)
  )
end
puts "20 Users created!"

50.times do |i|
  user = User.all.shuffle.last
  city = City.all.shuffle.last
  Listing.create!(
    available_beds: rand(1..12),
    price: rand(1..99999),
    description: Faker::Lorem.paragraph_by_chars(number: 140, supplemental: true),
    has_wifi: Faker::Boolean.boolean(true_ratio: 0.7),
    welcome_message: Faker::Lorem.paragraph(sentence_count: 2, random_sentences_to_add: 2),
    city_id: city.id,
    user_id: user.id
  )
end
puts "50 Listings created!"
