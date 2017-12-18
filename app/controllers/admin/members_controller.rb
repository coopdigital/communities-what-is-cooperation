module Admin
  class MembersController < AdminController

    def index
      @members = Member.order('created_at ASC')
    end

    def create

    end

  end
end
