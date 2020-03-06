class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def welcome
  end

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  def category
    @services = Service.where("category = ?", params[:category])
    @category = Service.categories.key(params[:category].to_i)
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @category = Service.categories.keys
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @category = Service.categories.keys

  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.business_id = current_user.business.id
    @service.picture.attach(params[:service][:picture])
    # TradeCategory.create_trade_category(current_user, @service)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        @category = Service.categories.keys
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    service = Service.find(params[:id])
    current_user.services.push(service)
    if current_user.save
        flash[:notice] = "Added new service"
        redirect_to trade_category__path
    else
        flash[:alert] = "Oops! There was a problem adding that service"
        redirect_back(fallback_location: service_path)
    end
end
  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        @category = Service.categories.keys
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:service_offered, :category, :description, :hourly_rate, :calendly_url)
    end
end
