class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.string :pic_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
