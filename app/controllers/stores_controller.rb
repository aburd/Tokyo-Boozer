class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  
  @location = Location.all
  @geojson = Array.new

  @location.each do |location|
    @geojson << { type: 'Feature',
                  geometry: {
                    type: 'Point',
                    coordinates: [location.longitude, location.latitude]
                    },
                  properties: {
                    name: store.name,
                    address: store.address,
                    :'marker-color'=> '#00607d',
                    :'marker-symbol'=> 'circle',
                    :'marker-size'=> 'medium'
                  }
                }
  end

  def index
    if params[:search]
      @stores = Store.search(params[:search]).order(name: :asc)
    else
      @stores = Store.order(name: :asc)
    end
  end

  def search
    @stores = Store.search params[:search]
  end

  def test
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find(params[:id])
  end

  def home
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :description, :picture, :web_address, :phone_number)
    end
end
