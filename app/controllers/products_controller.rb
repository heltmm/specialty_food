
class ProductsController < ApplicationController
  def index

    @products = Product.index(params[:page])
    @products = Product.search(params[:search]) if params[:search].present?
    @products = Product.american(params[:page]) if params[:american] === "true"
  end

  def about
    @products = Product.three_most_recent
    @most_reviewed_product = Product.most_reviews[0]
  end

  def new
    @product = Product.new
  end

def create
  @product = Product.new(product_params)
  if @product.save
    flash[:notice] = "Product successfully added!"
    redirect_to products_path
  else
    render :new
  end
end

def show
  @product = Product.find(params[:id])
  @reviews = @product.reviews.three_most_recent
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_path
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to products_path
  else
    render :edit
  end
end

private
  def product_params
    params.require(:product).permit(:name, :cost, :img, :country_of_origin)
  end

end
