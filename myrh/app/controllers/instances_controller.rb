class InstancesController < ApplicationController

  before_action :prepare_session

  def prepare_session
    if session[:user_status] != "2"
      return redirect_to controller: 'defaults', action: 'index'
    end
  end

  # GET /instances
  # GET /instances.json
  def index
    @surveys = Survey.all
    @instances = Instance.all
    @buisinesses = Buisiness.all
  end

  # GET /instances/1
  # GET /instances/1.json
  def show
     @instance = Instance.find(params[:id])
  end

  # GET /instances/new
  def new
    @buisinesses = Buisiness.all
    @surveys = Survey.all
    @instance = Instance.new
  end

  # GET /instances/1/edit
  def edit
    @surveys = Survey.all
    @instance = Instance.find(params[:id])
    @buisinesses = Buisiness.all
  end

  # POST /instances
  # POST /instances.json
  def create
    @instance = Instance.new(instance_params)

    respond_to do |format|
      if @instance.save
        format.html { redirect_to @instance, notice: 'Instance was successfully created.' }
        format.json { render :show, status: :created, location: @instance }
      else
        format.html { render :new }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instances/1
  # PATCH/PUT /instances/1.json
  def update
     @instance = Instance.find(params[:id])
    respond_to do |format|
      if @instance.update(instance_params)
        format.html { redirect_to @instance, notice: 'Instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance }
      else
        format.html { render :edit }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
     @instance = Instance.find(params[:id])
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to instances_url, notice: 'Instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params.require(:instance).permit(:id_instance, :year, :month, :id_survey)
    end
end
