class Admin::ExportsController < Admin::AdminController
  before_action :set_export

  def kitchen
  end

  def courier
  end

  def manager
  end

  private

  def set_export
    @users = User.all
    respond_to do |format|
      format.xls
    end
  end
end
