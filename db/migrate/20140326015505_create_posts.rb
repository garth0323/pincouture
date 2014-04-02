class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.string :host
    	t.string :link
    	t.text :description
    	t.integer :user_id
    	t.integer :pin_id

      t.timestamps
    end
  end
end
