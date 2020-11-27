class EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to @email
    else
      render action: "contact"
    end
  end


  private
    def email_params
      params.require(:email).permit(:sender_name, :sender_email, :title, :content)
    end
end
