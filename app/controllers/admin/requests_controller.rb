class Admin::RequestsController < AdminController
  def index
    @requests = Request.all
  end
  
  def show
    @request = Request.find params[:id]
    @cities = @request.cities.split(",")
    @flights = @request.flights.split(",")
  end

  def update
    @request = Request.find params[:id]
    @request.approved = true
    @request.save
    Usermailer.approved(@request).deliver
    redirect_to "/admin/requests"
  end
  
  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to "/admin/requests"
  end
end
