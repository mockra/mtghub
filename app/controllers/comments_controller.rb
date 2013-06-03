class CommentsController < ApplicationController
  before_filter :load_commentable
  respond_to :js

  def create
    @comment = @commentable.comments.build comment_params
    @comment.user = current_user
    @comment.save
    render layout: false
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
