class Room < ApplicationRecord
  include PrimaryKeyIsUuid

  has_many :players

  after_initialize :after_initialize_callback

  def after_initialize_callback
    self.password_for_join = SecureRandom.hex(8)
    self.expired_at = 2.day.from_now
  end

  def join(password_for_join:)
    return false if self.password_for_join != password_for_join
    players.create
  end
end
