class AddCommentToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :comment, :text
  end
end
