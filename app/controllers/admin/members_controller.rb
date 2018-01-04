require 'securerandom'

module Admin
  class MembersController < AdminController

    def index
      @members = Member.order('created_at ASC')
      @involvement_responses = Submission.where.not(involvement: "").pluck(:involvement).uniq
      @activity_suggestions = Submission.where.not(activity_suggestion: "").pluck(:activity_suggestion).uniq
      @interests = Activity.with_thumbs_up.map{|activity| [activity, activity.interests.thumbs_up.count]}.sort_by(&:last).reverse
      @disinterests = Activity.with_thumbs_down.map{|activity| [activity, activity.interests.thumbs_down.count]}.sort_by(&:last).reverse
    end

    def create
      member = Member.create!(
        postcode: params[:postcode],
        uuid: SecureRandom.hex(3)
      )
      redirect_to admin_members_path, flash: {member_uuid: member.uuid}
    end

    def show
      @member = Member.find_by!(uuid: params[:id])
    end

  end
end
