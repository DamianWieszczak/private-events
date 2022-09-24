class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attendees_events, dependent: :destroy
  has_many :attendees, through: :attendees_events, dependent: :destroy
  
  validates :title, presence: true, length: { in: 3..50 }
  validates :description, presence: true, length: { in: 3..400 }
  validates :date, :location, presence: true

  scope :past, -> { where("date < ?", Time.current).order(date: :desc) }
  scope :upcoming, -> { where("date > ?", Time.current).order(:date) }
end
