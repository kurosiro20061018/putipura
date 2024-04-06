class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.integer :item_id
      t.string :lotion
      t.string :emulsion
      t.string :beauty_serum
      t.string :others
      t.string :facial_wash
      t.string :cleansing
      

      t.timestamps
    end
  end
end
