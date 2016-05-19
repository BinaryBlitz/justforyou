5.times do
  User.create(first_name: Faker::Name.first_name, 
             last_name: Faker::Name.last_name, 
             email: Faker::Internet.email,
             phone_number: "+#{Faker::Number.number(10)}")
end
Admin.create(email: "admin@admin.com", password: "12345678")