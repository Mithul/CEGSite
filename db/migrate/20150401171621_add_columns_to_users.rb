class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	# To idetify if user is student,proff,club
    add_column :users, :category, :string
    add_column :users, :department, :reference
    # Student specific
    add_column :users, :degree, :string
    add_column :users, :roll_no, :string
    add_column :users, :year, :integer
    # Proff specific
    add_column :users, :designation, :string
    add_column :users, :specialisation, :string
  end
end
