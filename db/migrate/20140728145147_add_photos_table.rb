class AddPhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user, index: true, null: false
      t.timestamps null: false
    end
  end
end
