class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :genre_id
      t.string :name, null: false
      t.integer :price, null: false
    end
  end
end
