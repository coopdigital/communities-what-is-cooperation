namespace :data do
  desc 'Refreshes the activity data, deactivating missing ones and creating new ones'

  task refresh_activities: :environment do
    activities = Rails.application.config.spotlight.activities
    activities.each do |activity_name|
      Activity.find_or_create_by!(name: activity_name)
    end
    Activity.where.not(name: activities).update_all(active: false)
  end

  task finalise_submissions: :environment do |t, args|
    member_ids = ENV['member_ids'].split(',')
    Member.where(uuid: member_ids).each do |member|
      puts "Finalising member: #{member.uuid}"
      member.submissions.finished.update_all(final: true)
    end
  end
end
