class EmailsController < ApplicationController

  def new

  end

  def create
    @email = Email.new(email_params)
    @email.save
    redirect_to @email
  end


  private
    def email_params
      params.require(:email).permit(:sender_name, :sender_email, :title, :content)
    end
end
