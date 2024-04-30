namespace :destroy_old_rooms do
  desc 'Destroy rooms that have expired'
  task destroy: :environment do
    Room.where('expired_at < ?', Time.current).destroy_all
  end
end
