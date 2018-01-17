class MembersController < ApplicationController

  def new
    @member = Member.new
  end

  def create
    member = Member.create!(
      name: params[:member][:name],
      uuid: SecureRandom.hex(3),
      source: cookies[:source] || 'anonymous'
    )
    submission = member.submissions.create!(uuid: SecureRandom.hex(3))
    redirect_to submission_activities_path(submission)
  end

end
