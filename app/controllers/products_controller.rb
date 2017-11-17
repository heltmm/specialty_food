
class ProductsController < ApplicationController
  def index
    @products = Product.three_most_recent
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
  @reviews = @product.reviews

end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
