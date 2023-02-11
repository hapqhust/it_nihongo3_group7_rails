class RestaurantCommentsController < ApplicationController
  before_action :set_restaurant_comment, only: %i[ show edit update destroy ]

  # GET /restaurant_comments or /restaurant_comments.json
  def index
    @restaurant_comments = RestaurantComment.all
  end

  # GET /restaurant_comments/1 or /restaurant_comments/1.json
  def show
  end

  # GET /restaurant_comments/new
  def new
    @restaurant_comment = RestaurantComment.new
  end

  # GET /restaurant_comments/1/edit
  def edit
  end

  # POST /restaurant_comments or /restaurant_comments.json
  def create
    @restaurant_comment = RestaurantComment.new(restaurant_comment_params)
    @restaurant_comment.user_id = current_user.id
    respond_to do |format|
      if @restaurant_comment.save
        url = "/restaurants/" + @restaurant_comment.restaurant_id.to_s
        format.html { redirect_to url, notice: 'Restaurant comment was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_comments/1 or /restaurant_comments/1.json
  def update
    respond_to do |format|
      if @restaurant_comment.update(restaurant_comment_params)
        format.html { redirect_to @restaurant_comment, notice: "Restaurant comment was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_comments/1 or /restaurant_comments/1.json
  def destroy
    @restaurant_comment.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_comments_url, notice: "Restaurant comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_comment
      @restaurant_comment = RestaurantComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_comment_params
      params.require(:restaurant_comment).permit(:user_id, :restaurant_id, :comment)
    end
end
