class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user
  
  validates :title, presence: true, length: { in: 3..50 }
  validates :description, presence: true, length: { in: 3..400 }
end
