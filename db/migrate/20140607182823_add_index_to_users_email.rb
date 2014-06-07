class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #force emails to be unique by implementing an index on this field.
    # this will mean that even unsaved users can't be generated with duplicate emails. 
    add_index :users, :email, unique: true 
  end
end
