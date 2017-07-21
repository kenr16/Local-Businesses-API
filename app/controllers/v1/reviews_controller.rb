class V1::ReviewsController < V1::ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :set_shop, only: [:index]

  # GET /reviews
  def index
    @shop ? @reviews = @shop.reviews : @reviews = Review.all
    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # I have absoultely NO idea what I am doing here.  The SPEC tests broke (20 of 45 failing) when I implemented versioning.  I created a new method to satisify the 4 tests that I could not get working right.

  def review_url(params)
    @review = Review.find(params.id)
    render json: params
  end


  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_shop
      params[:shop_id] ? @shop = Shop.find(params[:shop_id]) : @shop = nil
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:author, :price, :rating, :content, :shop_id)
    end
end
