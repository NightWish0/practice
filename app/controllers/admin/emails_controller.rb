module Admin
  class EmailsController < Admin::ApplicationController

    def show
      @email = Email.find(params[:id])

    end

  end
end
