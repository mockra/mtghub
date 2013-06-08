class CommentsController < ApplicationController
  before_filter :load_commentable, only: :create
  respond_to :js

  def create
    @comment = @commentable.comments.build comment_params
    @comment.user = current_user
    @comment.save
    render layout: false
  end

  def destroy
    @comment = current_user.comments.find_by_id params[:id]
    @comment.destroy
    render nothing: true
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
