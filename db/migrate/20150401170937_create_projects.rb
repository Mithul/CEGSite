class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.string :domain
      t.references :mentor

      t.timestamps null: false
    end
  end
end
