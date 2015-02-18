class Attendance < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  validates :event, uniqueness: {scope: :user}
end
