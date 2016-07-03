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

  def block_for(delivery)
    "#{delivery.program.block.name} / #{delivery.position + 1}"
  end

  def substitutions_for(user)
    user.substitutions.map { |substitution| substitution.product.name }.join(', ')
  end
end
