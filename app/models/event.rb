class Event < ActiveRecord::Base
  belongs_to :host, class_name: User, foreign_key: :user_id
  has_many :attendances
  has_many :guests, through: :attendances, source: :user
end
