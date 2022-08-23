class ProductTagsController < ApplicationController
    def index
        @product_tags = ProductTag.all
    end
    
    def show
        @product_tag = ProductTag.find(params[:id])
    end
    
    def new
        @product_tag = ProductTag.new
    end
    
    def create
        @product_tag = ProductTag.new(product_tag_params)
        if @product_tag.save
            flash[:success] = "Producttag has been created succesfully"
            redirect_to @product_tag
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product_tag = ProductTag.find(params[:id])
    end

    
    def update
        @product_tag = ProductTag.find(params[:id])
        if @product_tag.update(product_tag_params)
            redirect_to @product_tag
            flash[:success] = "Producttag has been updated succesfully"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product_tag = ProductTag.find(params[:id])
        @product_tag.destroy
        redirect_to root_path, status: :see_other
        flash[:success] = "Producttag has been destroyed succesfully"
    end
    

    private
    def product_tag_params
        params.require(:product_tag).permit(:product_id,{:tag_id => []})
    end
end
