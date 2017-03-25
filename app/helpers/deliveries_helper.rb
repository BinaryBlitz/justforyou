module DeliveriesHelper
  def formatted_scheduled_for(delivery)
    I18n.l(delivery.scheduled_for, format: :with_ends_at_time, ends_at: delivery.ends_at)
  end
end
