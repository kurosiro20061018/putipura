class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :item_id
      t.integer :user_id
      t.text :content
    end
  end
end