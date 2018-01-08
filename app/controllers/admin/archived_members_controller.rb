module Admin
  class ArchivedMembersController < AdminController

    def index
      @members = Member.order('created_at ASC')
    end

  end
end
