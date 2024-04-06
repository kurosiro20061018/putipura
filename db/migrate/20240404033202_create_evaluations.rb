class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :item_id
      t.integer :use_id
    end
  end
end
