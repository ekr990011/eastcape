class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      
      t.string :tempf
      t.string :tempc
      t.integer :wicon
      t.string :wtext

      t.timestamps null: false
    end
  end
end
