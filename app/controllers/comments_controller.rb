class CommentsController < ApplicationController
  def index
    
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
