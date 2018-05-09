class AddApprovedByToIpAssets < ActiveRecord::Migration[5.0]
  def change
  	add_column :ip_assets, :approved_by, :string
  end
end
