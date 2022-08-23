class TagsController < ApplicationController
    def index
        @tags = Tag.all
    end
    
    def show
        @tag = Tag.find(params[:id])
    end
    
    def new
        @tag = Tag.new
    end
    
    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            flash[:success] = "You have created your tag successfully"
            redirect_to @tag
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    
    def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params)
            redirect_to @tag
            flash[:success] = "You have updated your tag succesfully"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to root_path, status: :see_other
        flash[:success] = "You have deleted your tag successfully"
    end
    

    private
    def tag_params
        params.require(:tag).permit(:tag,:tag_description)
    end
end
