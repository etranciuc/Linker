class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile


  def first_name=(value)
    value = value.present? ? value.nameize : nil
    write_attribute :first_name, value
  end

  def last_name=(value)
    value = value.present? ? value.nameize : nil
    write_attribute :last_name, value
  end
end
