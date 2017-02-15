class DefaultsController < ApplicationController
  def index
    puts params.inspect
  end

  def home

  	@buisinesses = Buisiness.all
    @instances = Instance.all
  end


  def survey_candidat
  	

  	@user = User.find_by_id(session[:user_id])
  	
	@answer = Answer.find_by(id_survey: @user[:id_instance], id_user: @user[:id])

	@my = JSON.parse(@answer[:json])

	p @my

  	@instance = Instance.find_by_id(@user.id_instance)

  	@survey = Survey.find_by_id(@instance.id_survey)

  end


  def sendquestion
  	
	@data = params[:survey].to_json
	@user = User.find_by_id(session[:user_id])

	@this = Answer.find_by(id_survey: @user[:id_instance], id_user: @user[:id])

	if @this != nil 

		@this.update!(json: @data,
        	id_survey: @user[:id_instance],
        	id_user: @user[:id])
	else

		Answer.create!(json: @data,
        	id_survey: @user[:id_instance],
        	id_user: @user[:id])
	end

	redirect_to controller: 'defaults', action: 'survey_candidat'
  end
end
