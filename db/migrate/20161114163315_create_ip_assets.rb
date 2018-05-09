class CreateIpAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_assets do |t|
      t.string :title
      t.text :description
      t.string :filename

      t.timestamps
    end
  end
end
