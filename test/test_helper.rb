ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end

class ActionDispatch::IntegrationTest
  def sign_in_admin(password: 'password')
    admin = admins(:admin)
    post admin_session_path, params: { admin: { email: admin.email,
                                                password: password } }
  end
end
