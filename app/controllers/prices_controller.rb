class PricesController < ApplicationController
	def show
		@price=Price.find(1)
	end

	def index
		@prices = Price.all
		@price=Price.find(1)
	end

	def edit
		@price=Price.find(1)
	end

	def update
		@price=Price.find(1)
		if @price.update(params.require(:price).permit(:premium, :base))
			redirect_to root_path, notice: "Los precios fueron modificados exitosamente"
      	else
        	render :edit
      	end
	end
end
