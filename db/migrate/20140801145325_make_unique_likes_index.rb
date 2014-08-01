class MakeUniqueLikesIndex < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :liked_object_id, :liked_object_type], unique: true, name: "like_index"
  end
end
