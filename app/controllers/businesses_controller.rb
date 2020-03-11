class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
    # @businesses = current_user.business
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    if current_user.business.id == params[:id].to_i
      @business = current_user.business
      @business.services
    else
      redirect_to root_path
    end
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    @business.user = current_user

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def orders
    if current_user.business.id == params[:id].to_i
      @business = current_user.business
      @services = @business.services
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:business_name, :service_region)
    end
end
