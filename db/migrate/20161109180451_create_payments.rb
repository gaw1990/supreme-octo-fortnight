class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount_cents, null: false
      t.references :loan, foreign_key: true
      t.timestamps null: false
    end
  end
end
