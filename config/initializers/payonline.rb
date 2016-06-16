Payonline.config do |config|
  config.merchant_id = Rails.application.secrets.payonline_merchant_id
  config.private_security_key = Rails.application.secrets.payonline_private_security_key
  config.return_url = Rails.application.secrets.payonline_return_url
  config.fail_url = Rails.application.secrets.payonline_fail_url
end
