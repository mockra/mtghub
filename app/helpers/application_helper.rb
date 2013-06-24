module ApplicationHelper
  def authorized? user
    user == current_user
  end

  def markdown text
    carpet = Redcarpet::Markdown.new Redcarpet::Render::HTML, autolink: true,
      safe_links_only: true, hard_wrap: true, filter_html: true
    carpet.render(text).html_safe
  end
end
