module ApplicationHelper
  def authorized? user
    user == current_user
  end

  def markdown text
    options = %i[hard_wrap filter_html autolink no_intraemphasis fenced_code gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe
  end
end
