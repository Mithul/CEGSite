class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :club
      t.string :location

      t.timestamps null: false
    end
  end
end
