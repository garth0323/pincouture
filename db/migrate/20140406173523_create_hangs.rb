class CreateHangs < ActiveRecord::Migration
  def change
    create_table :hangs do |t|
    	t.integer :user_id
    	t.integer :post_id

      t.timestamps
    end
  end
end
