5.times do
  User.create(first_name: Faker::Name.first_name, 
             last_name: Faker::Name.last_name, 
             email: Faker::Internet.email,
             phone_number: "+#{Faker::Number.number(10)}")
end
Program.create(name: "Program",
               description: "Description",
               duration: 10,
               primary_price: 300,
               secondary_price: 200,
               preview_image: Faker::Placeholdit.image("50x50"))
Admin.create(email: "admin@admin.com", password: "12345678")
