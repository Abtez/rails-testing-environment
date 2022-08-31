class CheeseController < ApplicationController

    def index
        cheese = Cheese.all
        # render json: cheese, only: [:id, :name]
        render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    end
    
    def show
        cheese = Cheese.find_by(id: params[:id])
        if cheese
            render json: cheese
        else
            render json: {error: "Not found"}, status: :not_found
        end
    end
  
end