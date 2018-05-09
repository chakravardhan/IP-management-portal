class AddOrgPerToOwnerships < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :ownerships, :org_per, :float

  end
end
