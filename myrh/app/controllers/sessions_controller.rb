class SessionsController < ApplicationController

  def new
  end

  def create

	@user = User.find_by_email(params[:session][:email].downcase)
	if @user.present?
		status = BCrypt::Password.new(@user.password) == params[:session][:password]
  		if status
  			session[:user_id] = @user.id
  			session[:user_name] = @user.name
  			session[:user_status] = @user.status

 			flash[:good] = 'Vous etes connecté'
      		return redirect_to controller: 'defaults', action: 'index', error: flash[:good]
  		end

  	end

		flash[:danger] = 'Invalid email/password'
      	return redirect_to controller: 'sessions', action: 'new', error: flash[:danger]

  end




  def destroy
  	session.delete(:user_name)
	session.delete(:user_id)
	session.delete(:user_status)


  	redirect_to controller: 'defaults', action: 'index', error: flash[:danger]

  end



end