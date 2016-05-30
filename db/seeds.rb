5000.times do
  Student.create! name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.street_address, age: rand(20..30)
end