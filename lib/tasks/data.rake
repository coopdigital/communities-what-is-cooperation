namespace :data do
  desc 'Refreshes the activity data, deactivating missing ones and creating new ones'

  task refresh_activities: :environment do
    activities = Rails.application.config.spotlight.activities
    activities.each do |activity_name|
      Activity.find_or_create_by!(name: activity_name)
    end
    Activity.where.not(name: activities).update_all(active: false)
  end
end
