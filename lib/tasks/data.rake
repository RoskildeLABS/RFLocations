namespace :data do

  desc "Import data from CSV file"
  task :import => :environment do
    require 'CSV'

    # Remove old data
    [Category, Location].map &:delete_all

    # Import new
    data = CSV.read(Rails.root + "public/Map2013-1.3.csv")
    data.shift # Throw away headers
    data.each do |row|
      category = Category.find_or_create_by_title(row[1])
      location = Location.create(title: row[2], longitude: row[4], latitude: row[3], comment: row[5], category: category)
      puts location.inspect
    end
  end

end
