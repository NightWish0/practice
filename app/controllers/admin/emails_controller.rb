module Admin
  class EmailsController < Admin::ApplicationController

    http_basic_authenticate_with name: "admin", password: "admin"

    def index
      @emails = Email.all
    end

    def show
      @email = Email.find(params[:id])
    end

    def destroy
      @email = Email.find(params[:id])
      @email.destroy
      redirect_to admin_email_path
    end

  end
end
