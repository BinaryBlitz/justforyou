class ManagerExport < Export
  def to_csv
    CSV.generate(super) do |csv|
      @deliveries.each do |delivery|
        csv << [
          delivery.id, delivery.user.full_name,
          substitutions_for(delivery.user), block_for(delivery), delivery.user.phone_number,
          address_for(delivery), delivery.scheduled_for, delivery.comment
        ]
      end
    end
  end

  def filename
    "Экспорт для менеджеров #{format_time(Time.zone.now)}.csv"
  end

  private

  def header
    [
      '№', 'ФИО', 'Замены', 'Блок / День', 'Телефон',
      'Адрес доставки', 'Время доставки', 'Примечание'
    ]
  end
end
