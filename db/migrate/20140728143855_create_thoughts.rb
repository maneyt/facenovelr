class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.belongs_to :user, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
