class BuisinessesController < ApplicationController

  before_action :prepare_session

  def prepare_session
    if session[:user_status] != "2"
      return redirect_to controller: 'defaults', action: 'index'
    end
  end

  # GET /buisinesses
  # GET /buisinesses.json
  def index
    @buisinesses = Buisiness.all
  end

  # GET /buisinesses/1
  # GET /buisinesses/1.json
  def show
    @buisiness = Buisiness.find(params[:id])
  end

  # GET /buisinesses/new
  def new
    @buisiness = Buisiness.new
  end

  # GET /buisinesses/1/edit
  def edit
    @buisiness = Buisiness.find(params[:id])
  end

  # POST /buisinesses
  # POST /buisinesses.json
  def create
    @buisiness = Buisiness.new(buisiness_params)

    respond_to do |format|
      if @buisiness.save
        format.html { redirect_to @buisiness, notice: 'Buisiness was successfully created.' }
        format.json { render :show, status: :created, location: @buisiness }
      else
        format.html { render :new }
        format.json { render json: @buisiness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buisinesses/1
  # PATCH/PUT /buisinesses/1.json
  def update
    @buisiness = Buisiness.find(params[:id])
    respond_to do |format|
      if @buisiness.update(buisiness_params)
        format.html { redirect_to @buisiness, notice: 'Buisiness was successfully updated.' }
        format.json { render :show, status: :ok, location: @buisiness }
      else
        format.html { render :edit }
        format.json { render json: @buisiness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buisinesses/1
  # DELETE /buisinesses/1.json
  def destroy
    @buisiness = Buisiness.find(params[:id])
    @buisiness.destroy
    respond_to do |format|
      format.html { redirect_to buisinesses_url, notice: 'Buisiness was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buisiness
      @buisiness = Buisiness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buisiness_params
      params.require(:buisiness).permit(:name, :city)
    end
end
