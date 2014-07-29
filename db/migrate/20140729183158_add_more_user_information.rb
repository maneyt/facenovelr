class AddMoreUserInformation < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, null: false, default: ""
    add_column :users, :about_me, :string, null: false, default: ""
  end
end
