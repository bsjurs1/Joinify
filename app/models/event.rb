
class Event < ApplicationRecord
  has_and_belongs_to_many :invitees, class_name: "User"
  has_and_belongs_to_many :attendees, class_name: "User"
  belongs_to :owner, class_name: "User"

  validates :title, presence: true
  validate :validate_title_length
  validates :start_date, presence: true
  validate :validate_future
  validate :validate_decription_length

  def validate_title_length
  	if title.length > 50
  		errors.add(:title, "The title can't be more than 50 characters long")
  	end
  end

  def validate_future
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "can't be in the past")
    end
  end

  def validate_decription_length
    if description.length > 255
      errors.add(:description, "The description can't be more than 255 characters long")
    end

  end

end