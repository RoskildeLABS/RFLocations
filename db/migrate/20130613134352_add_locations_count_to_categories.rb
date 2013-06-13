class AddLocationsCountToCategories < ActiveRecord::Migration
  def up
    add_column :categories, :locations_count, :integer, default: 0

    Category.find_each do |category|
      Category.reset_counters(category.id, :locations)
    end
  end

  def down
    remove_column :categories, :locations_count
  end
end
