class MakeLikesPolymorphic < ActiveRecord::Migration
  def change
    add_column :likes, :liked_object_id, :integer, null: false
    add_column :likes, :liked_object_type, :string, null: false
    remove_column :likes, :photo_id
  end
end
