class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true

  # List of available ranges to search for
  def self.avail_range
    return [1, 2, 5, 10, 30, 50]
  end
end
