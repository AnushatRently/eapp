class ReviewsController  < ApplicationController

  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  after_action:set_avg_rating,only:%i[create edit]

  def index
    @reviews = Review.all
  end

  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    session[:id]=params[:id]
    @product=Product.find(params[:id])
  end

  # GET /reviews/1/edit
  def edit
    @product=Product.find(session[:id])
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @product=Product.find(session[:id])

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: "review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to root_path, notice: "review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "review was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

  def set_review
    @review = Review.find(params[:id])
  end

    def review_params
      params.require(:review).permit(:user_id, :product_id, :comment, :rating)
    end

    def set_avg_rating
      @avg=Review.where(product_id: @product.id).average(:rating)
      Product.update(@product.id,rating:(@avg))
    end

end
