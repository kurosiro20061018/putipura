class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :item_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end