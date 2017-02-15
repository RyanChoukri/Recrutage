class UsersController < ApplicationController
  def index
  end

  def create

    if params[:name].present? &&
      params[:lastname].present? &&
      params[:date].present? &&
      params[:email].present? &&
      params[:instance].present? &&
      params[:password].present?

      @instances = User.find_by(email: params[:email], id_instance: params[:instance])

      if @instances.present?

        flash[:notice] = "Vous êtes déjà inscrit à cette instance !!!"
        redirect_to controller: 'defaults', action: 'home', error: flash[:notice]

      else

        @password = BCrypt::Password.create(params[:password])

        User.create!(name: params[:name],
         lastname: params[:lastname],
         birthdate: params[:date],
         email: params[:email],
         password: @password,
         id_instance: params[:instance],
         status: 1)

        @data = {:name => params[:name], :generate => @generate, :email => params[:email]}


        UserMailer.welcome_email(@data).deliver

        flash[:notice] = "Vous avez recu un Mail"
        redirect_to controller: 'defaults', action: 'index', error: flash[:notice]

      end

    else

      flash[:notice] = "Il manque des info !!!"
      redirect_to controller: 'defaults', action: 'home', error: flash[:notice]

    end


  end



  def new
  end



  def destroy
  end



  def show
  end

  def addadmin

    if params[:name].present? &&
      params[:lastname].present? &&
      params[:login].present? &&
      params[:email].present?

      @instances = User.where("login = ? OR email = ?", params[:login] , params[:email])


      if @instances.present?

        flash[:notice] = "il existe deja un login ou un email"
        redirect_to controller: 'register', action: 'admin', error: flash[:notice]

      else

          
          @generate = (0...8).map { (65 + rand(26)).chr }.join

          @password = BCrypt::Password.create(@generate)

          User.create!(name: params[:name],
            lastname: params[:lastname],
            login: params[:login],
            email: params[:email],
            password: @password,
            status: 2)

          @arr = {:name => params[:name], :generate => @generate, :email => params[:email]}

          UserMailer.welcome_admin(@arr).deliver

        flash[:notice] = "Inscrition reussie"
        redirect_to controller: 'register', action: 'admin', error: flash[:notice]

      end

    else

     flash[:notice] = "Il manque des info !!!"
     redirect_to controller: 'register', action: 'admin', error: flash[:notice]
   end
 end


end
