class Export
  def initialize(deliveries, date)
    @deliveries = deliveries
    @date = date
  end

  def to_csv
    CSV.generate(headers: true, encoding: 'cp1251', col_sep: ';') do |csv|
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
end
