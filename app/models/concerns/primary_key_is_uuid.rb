module PrimaryKeyIsUuid
  extend ActiveSupport::Concern

  included do
    before_save :generate_uuid
  end

  def generate_uuid
    self.id = SecureRandom.uuid
  end
end
