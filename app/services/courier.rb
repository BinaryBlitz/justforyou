class Courier < Export
  def to_csv
    header = ['№', 'ФИО', 'Телефон', 'Адрес доставки', 'Время доставки', 'Примечание']
    file = 'courier.csv'

    super(header, file)

    CSV.open(file, 'a') do |csv|
      @deliveries.each do |delivery|
        csv << [
          delivery.id, delivery.purchase.user.full_name,
          delivery.purchase.user.phone_number,
          delivery.address.content, delivery.scheduled_for,
          delivery.comment
        ]
      end
    end
  end
end
