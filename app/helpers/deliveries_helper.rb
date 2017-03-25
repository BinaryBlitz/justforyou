module DeliveriesHelper
  def time_interval_for_delivery(delivery)
    I18n.l(
      delivery.scheduled_for, format: :with_ends_at_time, ends_at: delivery.ends_at.strftime('%H:%M')
    )
  end
end
