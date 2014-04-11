class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username 
      t.string :email
      t.string :password_digest 
      t.integer :posts

      t.timestamps
    end
  end
end
