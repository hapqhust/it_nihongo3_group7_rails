class RestaurantFoodsController < ApplicationController
  before_action :set_restaurant_food, only: %i[ show edit update destroy ]

  # GET /restaurant_foods or /restaurant_foods.json
  def index
    @restaurant_foods = RestaurantFood.all
  end

  # GET /restaurant_foods/1 or /restaurant_foods/1.json
  def show
      @restaurant_food_review = RestaurantFoodReview.new
  end

  # GET /restaurant_foods/new
  def new
    @restaurant_food = RestaurantFood.new
  end

  # GET /restaurant_foods/1/edit
  def edit
  end

  # POST /restaurant_foods or /restaurant_foods.json
  def create
    @restaurant_food = RestaurantFood.new(restaurant_food_params)

    respond_to do |format|
      if @restaurant_food.save
          url = "/restaurants/" + @restaurant_food.restaurant_id.to_s
        format.html { redirect_to url, notice: "Restaurant food was successfully created." }
        format.json { render :show, status: :created, location: @restaurant_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_foods/1 or /restaurant_foods/1.json
  def update
    respond_to do |format|
      if @restaurant_food.update(restaurant_food_params)
          url = "/restaurants/" + @restaurant_food.restaurant_id.to_s
        format.html { redirect_to url, notice: "Restaurant food was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_foods/1 or /restaurant_foods/1.json
  def destroy
    @restaurant_food.destroy
    respond_to do |format|
        url = "/restaurants/" + @restaurant_food.restaurant_id.to_s
      format.html { redirect_to url, notice: "Restaurant food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_food
      @restaurant_food = RestaurantFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_food_params
      params.require(:restaurant_food).permit(:restaurant_id, :name, :description, :image)
    end
end
