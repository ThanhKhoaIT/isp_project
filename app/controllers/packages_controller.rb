class PackagesController < ApplicationController
  
  def index
    @packages = Package.all
  end

  
  def show
    @package = Package.find(params[:id])
    @comment = Comment.new({package_id: @package.id})
  end

  
end
