class Admin::FlightsController < AdminController
  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end
  
  def create
    Flight.create params_strong
    redirect_to "/admin/flights"
  end

  def edit
    @flight = Flight.find params[:id]
  end

  def update
    @flight = Flight.find params[:id]
    @flight.update params_strong
    redirect_to "/admin/flights"
  end

  def destroy
    @flight = Flight.find params[:id]
    @flight.destroy
    redirect_to "/admin/flights"
  end
  
  def params_strong
    params.require(:flight).permit(:city_from_id, :city_to_id, :price, :total_hour, :type_use)
  end
end
