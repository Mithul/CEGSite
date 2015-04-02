class AddUserToNewsAndEvents < ActiveRecord::Migration
  def change
    add_reference :news, :user, index: true
    add_reference :events, :user, index: true
    add_foreign_key :news, :users
    add_foreign_key :events, :users
  end
end
