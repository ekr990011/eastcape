class CreateAdvertises < ActiveRecord::Migration
  def change
    create_table :advertises do |t|
      
      t.text :text
      t.string :email

      t.timestamps null: false
    end
  end
end
