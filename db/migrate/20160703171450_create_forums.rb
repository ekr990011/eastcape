class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.text :post
      t.references :user,  index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
