class Location < ActiveRecord::Base
  attr_accessible :comment, :latitude, :longitude, :title, :category
  belongs_to :category, counter_cache: true

  def as_json(opts = {})
    opts.merge! only: [ :id, :title, :latitude, :longitude, :comment ]
    opts.merge! methods: [ :category ]
    super(opts)
  end
end
