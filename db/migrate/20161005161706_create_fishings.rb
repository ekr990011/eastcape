class CreateFishings < ActiveRecord::Migration
  def change
    create_table :fishings do |t|
      t.string :biz_name
      t.string :tel
      t.string :tel2
      t.string :website
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
