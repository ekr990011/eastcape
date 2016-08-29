class CreateWundergrounds < ActiveRecord::Migration
  def change
    create_table :wundergrounds do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
