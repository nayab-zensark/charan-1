class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def new
        @order = Order.new
    end
    
    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to @order
            flash[:success] = "You have created your order successfully"
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @order = Order.find(params[:id])
    end

    
    def update
        @order = Order.find(params[:id])
        if @order.update(order_params)
            redirect_to @order
            flash[:success] = "You have updated your order successfully"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to root_path, status: :see_other
        flash[:success] = "You have deleted your order successfully"
    end
    

    private
    def order_params
        params.require(:order).permit(:item_name, :price, :quantity, :restaurant_id, :customer_id, :delivery_address)
    end
end
