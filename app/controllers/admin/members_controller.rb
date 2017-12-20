require 'securerandom'

module Admin
  class MembersController < AdminController

    def index
      @members = Member.order('created_at ASC')
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
