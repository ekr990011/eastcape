class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      
      t.text :text
      t.string :email

      t.timestamps null: false
    end
  end
end
