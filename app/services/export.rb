class Export

  def initialize(deliveries)
    @deliveries = deliveries
  end

  def kitchen
    date = ['Отчет на ' + Time.zone.now.strftime('%m-%d-%Y')]
    header = ['№', 'ФИО', 'Замены', 'Блок/День']
    file = 'kitchen.csv'

    CSV.open(file, 'wb') do |csv|
      csv << date
      csv << header

      @deliveries.each do |delivery|

        substitutions = delivery.purchase
                          .user.substitutions.map { |sub| sub.product.name }.join(', ')
        block = "#{delivery.purchase.program.block.name}/#{delivery.day_position}"

        csv << [
          delivery.id, delivery.purchase.user.full_name,
          substitutions, block
        ]
      end
    end
  end


  def courier
    date = ['Отчет на ' + Time.zone.now.strftime('%m-%d-%Y')]
    header = ['№', 'ФИО', 'Телефон', 'Адрес доставки', 'Время доставки', 'Примечание']
    file = 'courier.csv'

    CSV.open(file, 'wb') do |csv|
      csv << date
      csv << header

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

  def manager
    date = ['Отчет на ' + Time.zone.now.strftime('%m-%d-%Y')]
    header = [
      '№', 'ФИО', 'Замены', 'Блок/День', 'Телефон',
      'Адрес доставки', 'Время доставки', 'Примечание'
    ]
    file = 'manager.csv'

    CSV.open(file, 'wb') do |csv|
      csv << date
      csv << header

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
