class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.belongs_to :category
      t.decimal :latitude, {precision: 15, scale: 6}
      t.decimal :longitude, {precision: 15, scale: 6}
      t.string :comment

      t.timestamps
    end
    add_index :locations, :category_id
  end
end
