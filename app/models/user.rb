class User < ActiveRecord::Base
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      return user
    end
  end
end
