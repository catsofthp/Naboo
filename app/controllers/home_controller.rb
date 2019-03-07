class HomeController < ApplicationController
  def index
  end

  def admin_dashboard
    if current_user.is_admin
    else
      flash[:error] = "Tu ne peux pas accéder à cette page car tu n'es pas admin !"
      redirect_to root_path
    end
  end

end
