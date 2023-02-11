class RestaurantFoodReviewsController < ApplicationController
  before_action :set_restaurant_food_review, only: %i[ show edit update destroy ]

  # GET /restaurant_food_reviews or /restaurant_food_reviews.json
  def index
    @restaurant_food_reviews = RestaurantFoodReview.all
  end

  # GET /restaurant_food_reviews/1 or /restaurant_food_reviews/1.json
  def show
  end

  # GET /restaurant_food_reviews/new
  def new
    @restaurant_food_review = RestaurantFoodReview.new
  end

  # GET /restaurant_food_reviews/1/edit
  def edit
  end

  # POST /restaurant_food_reviews or /restaurant_food_reviews.json
  def create
    @restaurant_food_review = RestaurantFoodReview.new(restaurant_food_review_params)
    @restaurant_food_review.user_id = current_user.id
    respond_to do |format|
      if @restaurant_food_review.save
          url = "/restaurant_foods/" + @restaurant_food_review.restaurant_food_id.to_s
        format.html { redirect_to url, notice: "Restaurant food review was successfully created." }
        format.json { render :show, status: :created, location: @restaurant_food_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant_food_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_food_reviews/1 or /restaurant_food_reviews/1.json
  def update
    respond_to do |format|
      if @restaurant_food_review.update(restaurant_food_review_params)
        format.html { redirect_to @restaurant_food_review, notice: "Restaurant food review was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant_food_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant_food_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_food_reviews/1 or /restaurant_food_reviews/1.json
  def destroy
    @restaurant_food_review.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_food_reviews_url, notice: "Restaurant food review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_food_review
      @restaurant_food_review = RestaurantFoodReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_food_review_params
      params.require(:restaurant_food_review).permit(:user_id, :restaurant_food_id, :review)
    end
end
