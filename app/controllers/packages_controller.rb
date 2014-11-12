class PackagesController < ApplicationController
  
  def index
    @packages_count = Package.count
    page = params[:page] || 1
    @packages = Package.order("id desc")
    @packages = @packages[(page.to_i-1)*6..(page.to_i)*6-1] || []
  end

  
  def show
    @package = Package.find(params[:id])
    @comment = Comment.new({package_id: @package.id})
  end

  
end
