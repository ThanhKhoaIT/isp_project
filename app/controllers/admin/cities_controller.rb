class Admin::CitiesController < AdminController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end
  
  def create
    City.create params_strong
    redirect_to "/admin/cities"
  end

  def edit
    @city = City.find params[:id]
  end

  def update
    @city = City.find params[:id]
    @city.update params_strong
    redirect_to "/admin/cities"
  end

  def destroy
    @city = City.find params[:id]
    @city.destroy
    redirect_to "/admin/cities"
  end
  
  def params_strong
    params.require(:city).permit(:name, :country_name, :position_y, :position_x)
  end
end
