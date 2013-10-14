class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_one :profile, dependent: :destroy, inverse_of: :user

  has_many :likes, dependent: :destroy, foreign_key: :liker_id
  has_many :admirers, dependent: :destroy, foreign_key: :likee_id, class_name: "Like"

  has_many :locations, -> { where geocoded: false }, as: :locatable, dependent: :destroy

  has_one :geolocation, -> { where geocoded: true }, as: :locatable, dependent: :destroy, class_name: "Location"

  # Make sure a profile is associated with the user upon creation
  def make_profile
    self.profile = Profile.new if self.profile.nil?
  end

  def first_name=(value)
    make_profile
    self.profile.first_name = value
  end

  def last_name=(value)
    make_profile
    self.profile.last_name = value
  end

  def first_name
    self.profile.first_name
  end

  def last_name
    self.profile.last_name
  end

  #################################
  #         Messages              #
  #################################

  # Get all messages a user has sent or received
  def messages
    #Message.joins(:message_receivers).where(message_receivers: {user: User.last})
    Message.joins(:message_receivers).where("message_receivers.user_id = :q OR sender_id = :q", :q => self ).distinct
  end


  #################################
  #          People               #
  #################################

  # Returns a list of users where matches were made both ways
  def matches
    # This has only 2 SQLs
    my_likes = Like.where("liker_id = :q OR likee_id = :q", q: self.id)
    User.find(my_likes.map(&:likee_id) & my_likes.map(&:liker_id) - [self.id])

    # Following methods works but requires total of 3 SQLs
    # User.find(likes.map(&:likee_id) & admirers.map(&:liker_id))
  end
  alias_method :friends, :matches

  # Get another random user
  def find_match
    reject_list = likes.map(&:likee_id) + [self.id]
    user = User.where("id not in (?)", reject_list).limit(1).order("RANDOM()")
    return user.empty? ? nil : user.first
  end

  #################################
  #          Location             #
  #################################

  # Get only the N last locations
  def locations(limit = 5)
    Location.where(locatable_type: self.class.to_s, locatable_id: self.id, geocoded: false).order("id DESC").limit(limit)
  end

end
