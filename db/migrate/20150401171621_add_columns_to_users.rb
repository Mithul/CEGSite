class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	# To idetify if user is student,proff,club
    add_column :users, :category, :integer
    add_column :users, :department_id, :integer
    add_column :users, :phone, :string
    # Student specific
    add_column :users, :degree, :string
    add_column :users, :roll_no, :string
    add_column :users, :year, :integer
    # Proff specific
    add_column :users, :designation, :integer
    add_column :users, :specialisation, :string
  end
end
