class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      t.string :title
      t.string :url
      t.string :date
      t.timestamps null: false
    end
  end
end
