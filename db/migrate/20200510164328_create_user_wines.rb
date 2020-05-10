class CreateUserWines < ActiveRecord::Migration
  def change
    create_table :user_wines do |t|
      t.integer :user_id
      t.integer :wine_id
      t.string :notes

      t.timestamps null: false
    end
  end
end
