
class ProductsController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 9)
    @products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 9) if params[:search].present?
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

private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
