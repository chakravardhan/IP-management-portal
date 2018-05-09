class RemoveUserTypefromUsers < ActiveRecord::Migration[5.0]
  def self.up
  remove_column :users, :user_type
end
def self.down
  remove_column :users, :user_type
end
end
