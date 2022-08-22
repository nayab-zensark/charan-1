class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end
    
    def show
        @restaurant = Restaurant.find(params[:id])
        @restaurantorders = Restaurant.find(params[:id]).orders
    end
    
    def new
        @restaurant = Restaurant.new
    end
    
    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to @restaurant
            flash[:success] = "You have created your restaurant successfully"
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    
    def update
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.update(restaurant_params)
            redirect_to @restaurant
            flash[:success] = "You have updated your restaurant successfully"

        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path
        flash[:success] = "You have deleted your restaurant successfully"
    end
    

    private
    def restaurant_params
        params.require(:restaurant).permit(:restaurant_name, :address, :restaurant_type)
    end
end
