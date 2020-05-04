class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_url
      t.string :password_digest
    end
  end
end
