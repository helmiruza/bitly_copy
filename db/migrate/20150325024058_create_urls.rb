class CreateUrls < ActiveRecord::Migration
  def change
  	create_table :urls do |u|
  		u.string :original_url
  		u.string :short_url
  		u.integer :click_count, default: 0
  		u.timestamps null:false
  	end
  end
end
