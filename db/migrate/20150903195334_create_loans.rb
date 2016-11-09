class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :funded_amount_cents
      t.timestamps null: false
    end
  end
end
