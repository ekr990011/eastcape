class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :biz_name
      t.string :tel
      t.string :tel2
      t.string :email
      t.string :website
      t.text :description

      t.timestamps null: false
    end
  end
end
