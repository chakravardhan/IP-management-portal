class AddColumnToIpAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :ip_assets, :status, :integer
    add_column :ip_assets, :attachment, :string
    add_column :ip_assets, :role, :string
  end
end
