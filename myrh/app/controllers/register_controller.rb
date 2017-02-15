class RegisterController < ApplicationController
  def candidat
    @instances = Instance.find_by_id(params[:id])
    @buisinesses = Buisiness.all


    if @instances.present?
    else
      redirect_to home_path
    end

  end

  def admin

  end
end