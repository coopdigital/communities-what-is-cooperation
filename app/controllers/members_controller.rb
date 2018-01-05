class MembersController < ApplicationController

  def new
  end

  def create
    member = Member.create!(
      uuid: SecureRandom.hex(3),
      source: cookies[:source] || 'anonymous'
    )
    submission = member.submissions.create!(uuid: SecureRandom.hex(3))
    redirect_to submission_involvement_path(submission)
  end

  def show
    @member = Member.find_by!(uuid: params[:id])
  end

end
