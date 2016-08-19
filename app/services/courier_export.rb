class CourierExport < Export
  def to_csv
    CSV.generate(super) do |csv|
      @deliveries.each do |delivery|
        csv << [
          delivery.id, delivery.user.full_name,
          delivery.user.phone_number, delivery.address.to_s,
          format_time_interval(delivery.scheduled_for), delivery.comment
        ]
      end
    end
  end

  def filename
    "Экспорт для курьеров #{format_time(Time.zone.now)}.csv"
  end

  private

  def header
    ['№', 'ФИО', 'Телефон', 'Адрес доставки', 'Время доставки', 'Примечание']
  end
end
