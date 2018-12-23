class AddUsersEmailAndUsernameUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [ :email, :username ], unique: true
  end
end
