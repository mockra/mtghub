module ApplicationHelper
  def authorized? user
    user == current_user
  end
end
