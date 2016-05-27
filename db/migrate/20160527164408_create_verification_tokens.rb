class CreateVerificationTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :verification_tokens do |t|
      t.string :token, null: false
      t.string :phone_number, null: false
      t.integer :code, null: false
      t.boolean :verified, default: false

      t.timestamps
    end
    add_index :verification_tokens, :token, unique: true
  end
end
