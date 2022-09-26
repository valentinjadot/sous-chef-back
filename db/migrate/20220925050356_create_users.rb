class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }
      t.boolean :vegan, default: false
      t.boolean :fin, default: false

      t.timestamps
    end
  end
end
