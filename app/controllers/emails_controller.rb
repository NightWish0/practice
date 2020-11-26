class EmailsController < ApplicationController


  def create
    @email = Email.new(email_params)
    @email.save
    render action: "contact"
  end


  private
    def email_params
      params.require(:email).permit(:sender_name, :sender_email, :title, :content)
    end
end
