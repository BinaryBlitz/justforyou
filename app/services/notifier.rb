class Notifier
  def initialize(user, message, options = {})
    return unless user.device_token.present?

    @user = user
    @device_token = user.device_token
    @message = message
    @options = options

    push
  end

  def push
    return if @message.blank? || @device_token.blank?

    push_ios_notification
  end

  private

  def push_ios_notification
    notification = Houston::Notification.new(
      token: @device_token,
      alert: @message, badge: 1, custom_data: @options
    )
    client.push(notification)

    Rails.logger.debug "#{Time.zone.now} iOS notification: #{@message}, user: #{@user.id}"
  end

  def client
    if Rails.application.secrets.apn_environment == 'production'
      Houston::Client.production
    else
      Houston::Client.development
    end
  end
end
