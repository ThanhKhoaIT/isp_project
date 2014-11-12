class CommentsController < ApplicationController
  def index
    @comments_count = Comment.count
    page = params[:page] || 1
    @comments = Comment.order("id desc")
    @comments = @comments[(page.to_i-1)*5..(page.to_i)*5-1]
  end

  def show
    
  end

  def new
    
  end

  def create
    comment = Comment.new(params_strong)
    comment.user_id = current_user.id
    if comment.save
      redirect_to "/packages/#{comment.package.id}"
    end
  end

  def edit
    
  end
  
  def update
    
  end

  def destroy
    
  end

  def params_strong
    params.require(:comment).permit(:body, :package_id)
  end
end
