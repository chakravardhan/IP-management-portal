class Ownerships < ActiveRecord::Migration[5.0]
  def change
  	create_table :Ownerships do |t|
      t.float :percentage
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :ip_asset, index: true, foreign_key: true

      t.timestamps null: false
  	end
  end
end
