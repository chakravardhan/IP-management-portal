class IpComms < ActiveRecord::Migration[5.0]
  def change
  	create_table :ip_comms do |t|
  	  t.integer :vote
  	  t.text :comment
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :ip_asset, index: true, foreign_key: true
      t.timestamps null: false
  end
  end
end
