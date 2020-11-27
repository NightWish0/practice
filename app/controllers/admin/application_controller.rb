class Admin::ApplicationController < ApplicationController

    http_basic_authenticate_with name: "admin", password: "admin"

    def authenticate_user
      render_404 unless current_user.admin?
    end

end
