class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :funded_amount_cents, null: false
      t.timestamps null: false
    end
  end
end
