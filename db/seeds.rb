user = User.create!(
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79998887766',
  email: 'email@email.com'
)

user.update!(api_token: 'foobar')

address = user.addresses.create!(
  content: 'Content',
  house: 1, apartment: 1, entrance: 1, floor: 1,
  latitude: 0.0, longitude: 0.0
)

Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

image = File.open(Rails.root.join('test', 'fixtures', 'files', 'blank.jpg'))

block = Block.create!(name: 'Block', image: image, color: '#fff')

program = Program.create!(
  name: 'Program', description: 'Description', preview: 'Preview', prescription: ['Prescription'],
  threshold: 10, primary_price: 2, secondary_price: 2, unit: 'day',
  block: block, image: image
)

day = program.days.create!(position: 1)

day.items.create!(
  content: 'Content',
  starts_at: '12:00', ends_at: '13:00',
  calories: 100, weight: 100
)

Order.create!(
  user: user, phone_number: '+79998887766',
  line_items_attributes: [
    { program: program, number_of_days: 10 }
  ]
)

purchase = user.purchases.create!(program: program, number_of_days: 5)

purchase.deliveries.create!(address: address, scheduled_for: 1.month.from_now)

product_type = ProductType.create!(name: 'Product type')
product_type.products.create!(name: 'Product')

Promotion.create!(name: 'Promotion', description: 'Description')
