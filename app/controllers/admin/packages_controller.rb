class Admin::PackagesController < AdminController
  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end
  
  def create
    Package.create params_strong
    redirect_to "/admin/packages"
  end

  def edit
    @package = Package.find params[:id]
  end

  def update
    @package = Package.find params[:id]
    @package.update params_strong
    redirect_to "/admin/packages"
  end

  def destroy
    @package = Package.find params[:id]
    @package.destroy
    redirect_to "/admin/packages"
  end
  
  def params_strong
    params.require(:package).permit!#(:id, :description, :total_amount, :total_days, :discount, :image, :name, :city_ids)
  end
end
