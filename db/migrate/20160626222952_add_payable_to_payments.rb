class AddPayableToPayments < ActiveRecord::Migration[5.0]
  def change
    add_reference :payments, :payable, polymorphic: true
    remove_reference :payments, :order
  end
end
