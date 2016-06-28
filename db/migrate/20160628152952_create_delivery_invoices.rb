class CreateDeliveryInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_invoices do |t|
      t.references :user, foreign_key: true
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
