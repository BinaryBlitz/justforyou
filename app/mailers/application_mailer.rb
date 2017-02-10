class ApplicationMailer < ActionMailer::Base
  default from: "postmaster@#{Rails.application.secrets.mailgun_domain}"
  layout 'mailer'

  I18n.default_locale = :ru
end
