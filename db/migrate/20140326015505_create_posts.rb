class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.string :apparel
    	t.string :link
    	t.string :price
    	t.text :description
    	t.integer :user_id
    	t.integer :clebrity_id
    	t.integer :pin_id

      t.timestamps
    end
  end
end
