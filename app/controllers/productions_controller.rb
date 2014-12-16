class ProductionsController < ApplicationController
  def index
    @productions_grid = initialize_grid(Production, per_page: 20,
                    name: 'production',
                    order: 'productions.start_date',
                    order_direction: 'desc')
  end

  def show
    @production = Production.find(params[:format])
  end

end
