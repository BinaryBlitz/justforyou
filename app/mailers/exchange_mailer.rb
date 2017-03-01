class ExchangeMailer < ApplicationMailer
  def new_exchange(exchange)
    @exchange = exchange
    mail(to: 'info@justforyou.ru')
  end
end
