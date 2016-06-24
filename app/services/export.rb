class Export
  def initialize(deliveries)
    @deliveries = deliveries
  end

  def to_csv(header, file)
    date = ['Отчет на ' + Time.zone.now.strftime('%m-%d-%Y')]

    CSV.open(file, 'wb') do |csv|
      csv << date
      csv << header
    end
  end
end
