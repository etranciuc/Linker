class Like < ActiveRecord::Base
  belongs_to :liker, class_name: "User"
  belongs_to :likee, class_name: "User"

  validates :liker,
    presence: true

  validates :likee,
    presence: true

end
