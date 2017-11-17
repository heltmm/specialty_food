class ReviewsController < ApplicationController
  def new
    @product = Post.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Post.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content_body, :rating)
  end
end
