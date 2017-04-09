class AddTimeToWundergrounds < ActiveRecord::Migration
  def change
    add_column :wundergrounds, :time, :string
  end
end
