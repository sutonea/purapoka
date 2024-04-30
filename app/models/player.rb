class Player < ApplicationRecord
  include PrimaryKeyIsUuid

  belongs_to :room
  has_many :choices
end
