class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_locale
  layout 'admin'

  private

  def set_locale
    I18n.locale = :ru
  end
end
