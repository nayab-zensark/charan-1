class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    
    def show
        @product = Product.find(params[:id])
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:success] = "Product has been created succesfully"
            redirect_to @product
        else

          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to @product
            flash[:success] = "Product has been updated succesfully"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to root_path, status: :see_other
        flash[:success] = "Product has been destroyed succesfully"
    end
    

    private
    def product_params
        params.require(:product).permit(:product_name,:product_description,:brand,:price)
    end
end
