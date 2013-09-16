class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_one :profile, dependent: :destroy, inverse_of: :user

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
end
