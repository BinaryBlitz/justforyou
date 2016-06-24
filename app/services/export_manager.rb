class ExportManager < Export
  def to_csv
    header = [
      '№', 'ФИО', 'Замены', 'Блок/День', 'Телефон',
      'Адрес доставки', 'Время доставки', 'Примечание'
    ]
    file = 'manager.csv'

    super(header, file)

    CSV.open(file, 'a') do |csv|
      @deliveries.each do |delivery|
        substitutions = delivery.purchase
                                .user.substitutions.map { |sub| sub.product.name }.join(', ')
        block = "#{delivery.purchase.program.block.name}/#{delivery.day_position}"

        csv << [
          delivery.id, delivery.purchase.user.full_name,
          substitutions, block, delivery.purchase.user.phone_number,
          delivery.address.content, delivery.scheduled_for, delivery.comment
        ]
      end
    end
  end
end
