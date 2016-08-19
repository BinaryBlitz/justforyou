class Export
  def initialize(deliveries)
    @deliveries = deliveries
  end

  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << header
    end
  end

  def filename
    raise NotImplementedError
  end

  private

  def header
    raise NotImplementedError
  end

  def format_time(time)
    time.strftime('%d/%m/%Y %R')
  end

  def format_time_interval(time, interval = 60)
    "#{format_time(time)} - #{format_time(time + interval.minutes)}"
  end

  def block_for(delivery)
    "#{delivery.program.block.name} / #{delivery.position + 1}"
  end

  def substitutions_for(user)
    user.substitutions.map { |substitution| substitution.product.name }.join(', ')
  end

  def address_for(delivery)
    address = delivery.address.content
    address << ", дом #{delivery.address.house}" if delivery.address.house.present?
    address << ", подъезд #{delivery.address.entrance}" if delivery.address.entrance.present?
    address << ", этаж #{delivery.address.floor}" if delivery.address.floor.present?
    address << ", квартира #{delivery.address.apartment}" if delivery.address.apartment.present?
  end
end
