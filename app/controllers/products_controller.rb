class ProductsController < ApplicationController
    def index
        @products = Product.all
    
    end
    
    def show
        @product = Product.find(params[:id])
        @producttags = Product.find(params[:id]).tags
    end
    
    def new
        @product = Product.new
        @all_tags = Tag.all
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:success] = "Product has been created succesfully"
            redirect_to products_path
        else
          render :new, status: :unprocessable_entity
          flash[:alert] = "Product not created,Try again"
        end
    end

    def edit
        @product = Product.find(params[:id])
        @all_tags = Tag.all
    end

    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path
            flash[:success] = "Product has been updated succesfully"
        else
          render :edit, status: :unprocessable_entity
          flash[:alert] = "Product not updated,Try again"
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path, status: :see_other
        flash[:success] = "Product has been destroyed succesfully"
    end
    

    private
    def product_params
        params.require(:product).permit(:product_name,:product_description,:brand,:price,tag_ids:[])
    end
end
