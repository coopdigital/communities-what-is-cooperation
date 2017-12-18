class MembersController < ApplicationController

  def show
    @member = Member.find_by!(uuid: params[:id])
  end

end
