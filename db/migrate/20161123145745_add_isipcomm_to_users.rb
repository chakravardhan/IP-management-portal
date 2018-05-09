class AddIsipcommToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :isipcomm, :boolean, default: false
  end
end
