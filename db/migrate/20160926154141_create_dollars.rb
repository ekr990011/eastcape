class CreateDollars < ActiveRecord::Migration
  def change
    create_table :dollars do |t|
      
      t.string :dollar
      t.string :candollar
      
      t.timestamps null: false
    end
  end
end
