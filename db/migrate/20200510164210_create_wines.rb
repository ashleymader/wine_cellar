class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :w_type
      t.string :vintage
      t.string :varietal
      t.string :producer

      t.timestamps null: false
    end
  end
end
