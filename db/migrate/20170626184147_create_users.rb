class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :pic_url
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
