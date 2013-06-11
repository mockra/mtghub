class CommentsController < ApplicationController
  before_filter :load_commentable, only: :create
  respond_to :js, :json

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

  def update
    @comment = current_user.comments.find_by_id params[:id]
    @comment.update_attributes comment_params
    respond_with @comment
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
