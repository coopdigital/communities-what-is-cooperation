require 'securerandom'

module Admin
  class MembersController < AdminController

    def index
      @members = Member.with_final_submission.order('created_at ASC')
      @involvement_responses = Submission.final.where.not(involvement: "").pluck(:involvement).uniq
      @activity_suggestions = Submission.final.where.not(activity_suggestion: "").pluck(:activity_suggestion).uniq
      @interests = Activity.joins(interests: :submission).where('interests.response' => 'yes', 'submissions.final' => true).map do |activity|
        [activity, activity.interests.joins(:submission).where('interests.response' => 'yes', 'submissions.final' => true).size]
      end.sort_by(&:last).reverse
      @disinterests = Activity.joins(interests: :submission).where('interests.response' => 'no', 'submissions.final' => true).map do |activity|
        [activity, activity.interests.joins(:submission).where('interests.response' => 'no', 'submissions.final' => true).size]
      end.sort_by(&:last).reverse
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
