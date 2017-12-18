require 'securerandom'

class SubmissionsController < ApplicationController

  def create
    member = Member.find_by!(uuid: params[:member_id])
    submission = member.submissions.create!(uuid: SecureRandom.hex(3))
    redirect_to submission_involvement_path(submission)
  end

  def show
    @submission = Submission.find_by!(uuid: params[:id])
    if @submission.finished?
      render :show
    else
      redirect_to member_path(@submission.member)
    end
  end

end
