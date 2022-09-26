class CreateOrders < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :vegan, default: false
      t.boolean :take_away, default: false
      t.boolean :active, default: true
      t.integer :meal
      t.datetime :sent_at
      t.date :execution_date, null: false

      t.timestamps
    end

    add_index :orders, [:user_id, :execution_date, :meal], unique: true, algorithm: :concurrently
  end
end
