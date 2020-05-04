class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :type
      t.integer :quantity
      t.string :vintage
      t.text :varietal
      t.text :producer
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
