class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Customer.find(params[:id])
        @customerorders = Customer.find(params[:id]).orders
    end
    
    def new
        @customer = Customer.new
    end
    
    def create
        @customer = Customer.new(customers_params)
        if @customer.save
            flash[:success] = "You have created your profile successfully"
            redirect_to @customer
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customers_params)
            
            redirect_to @customer
            flash[:success] = "You have updated your profile succesfully"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to root_path, status: :see_other
        flash[:success] = "You have deleted your profile successfully"
    end
    

    private
    def customers_params
        params.require(:customer).permit(:name, :mobile_number, :email, :address)
    end
end
