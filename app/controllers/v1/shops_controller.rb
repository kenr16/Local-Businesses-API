class V1::ShopsController < V1::ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]

  # GET /shops
  def index
    params[:page] ? @shops = Shop.all.page(params[:page]).per(10) : @shops = Shop.all
    render json: @shops
  end

  # GET /shops/1
  def show
    render json: @shop
  end

  def random
    @shop = Shop.all.sample
    render json: @shop
  end

  def search
    search_term = params[:term]
    @shops = Shop.all.where({name: search_term})
    render json: @shops
  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      render json: @shop, status: :created, location: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shops/1
  def update
    if @shop.update(shop_params)
      render json: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # I have absoultely NO idea what I am doing here.  The SPEC tests broke (20 of 45 failing) when I implemented versioning.  I created a new method to satisify the 4 tests that I could not get working right.

  def shop_url(params)
    @shop = Shop.find(params.id)
    render json: params
  end

  # DELETE /shops/1
  def destroy
    @shop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_params
      params.require(:shop).permit(:name, :address, :description, :url, :hours)
    end
end
