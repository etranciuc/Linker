class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  has_many :message_receivers
  has_many :receivers, through: :message_receivers, source: :user

  validates :body,
    presence: true

  validates :sender,
    presence: :true

  validates :receivers,
    length: {minimum: 1}

end
