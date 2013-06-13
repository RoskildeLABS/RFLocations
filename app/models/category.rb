class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :locations

  def as_json(opts = {})
    opts.merge! only: [ :id, :title, :locations_count ]
    super(opts)
  end
end
