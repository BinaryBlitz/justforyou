user = User.create!(
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79998887766',
  email: 'email@email.com'
)

address = user.addresses.create(
  content: 'Content',
  entrance: 1,
  floor: 1
)

admin = Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

image = File.open(Rails.root.join('test', 'fixtures', 'files', 'blank.jpg'))

block = Block.create!(name: 'Block', image: image)

program = Program.create!(
  name: 'Program',
  description: 'Description',
  preview: 'Preview',
  prescription: ['Prescription'],
  threshold: 10,
  primary_price: 2,
  secondary_price: 2,
  block: block,
  preview_image: image
)

day = program.days.create!(position: 1)

order = Order.create!(
  user: user,
  phone_number: '+79998887766',
  line_items_attributes: [
    { program: program, number_of_days: 10 }
  ]
)
