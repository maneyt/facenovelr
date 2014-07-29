class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :photo, index: true, null: false

      t.timestamps null:false
    end
    add_index :likes, [:user_id, :photo_id], unique: true
  end
end
