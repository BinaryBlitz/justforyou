class OrderMailer < ApplicationMailer
  def new_order(order)
    @order = order
    mail(to: 'info@justforyou.ru')
  end
end
