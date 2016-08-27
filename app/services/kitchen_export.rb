class KitchenExport < Export
  def to_csv
    CSV.generate(super, col_sep: ';') do |csv|
      @deliveries.each do |delivery|
        csv << [
          delivery.id, delivery.user.full_name,
          substitutions_for(delivery.user), block_for(delivery)
        ]
      end
    end
  end

  def filename
    "Экспорт для кухни #{format_time(@date)}.csv"
  end

  private

  def header
    ['№', 'ФИО', 'Замены', 'Блок / День']
  end
end
