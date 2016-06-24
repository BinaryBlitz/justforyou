class Kitchen < Export
  def to_csv
    header = ['№', 'ФИО', 'Замены', 'Блок/День']
    file = 'kitchen.csv'

    super(header, file)

    CSV.open(file, 'a') do |csv|
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
end
