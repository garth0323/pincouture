class CreateCelebrities < ActiveRecord::Migration
  def change
    create_table :celebrities do |t|
    	t.string :name
    	t.string :gender

      t.timestamps
    end
  end
end
