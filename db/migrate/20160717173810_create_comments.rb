class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :reply
      t.references :user,  index: true
      t.references :forum,  index: true

      t.timestamps null: false
    end
  end
end