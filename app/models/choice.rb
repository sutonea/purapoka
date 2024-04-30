class Choice < ApplicationRecord
  belongs_to :player

  def self.list
    %w(1 2 3 5 8 13)
  end
end
