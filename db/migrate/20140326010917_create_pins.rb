class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
    	t.string :description
    	t.string :image_url
    	t.integer :celebrity_id
    	t.integer :user_id


      t.timestamps
    end
  end
end
