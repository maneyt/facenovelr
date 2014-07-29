class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.belongs_to :sender, index: true, null: false
      t.belongs_to :recipient, index: true, null: false

      t.timestamps null: false
    end
  end
end
