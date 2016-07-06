class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'products/index'
  end

  def show
    @product = Product.find(params[:id])
    @comments = Comment.all
    render 'products/show'
  end

  def new
    @categories = Category.all
    render 'products/new'
  end

  def edit
    @categories = Category.all
    @product = Product.find(params[:id])
    render 'products/edit'
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:message] = 'Product was successfully created!'
    else
      flash[:message] = 'Error occurred while creating new product!'
    end
    redirect_to '/products'
  end

  def update
    Product.update(params[:id], product_params)
    redirect_to '/products'
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to '/products'
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :pricing, :category_id)
    end
end
