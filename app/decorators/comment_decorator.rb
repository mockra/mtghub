class CommentDecorator < Draper::Decorator
  delegate_all

  def md_content
    h.markdown content
  end
end
