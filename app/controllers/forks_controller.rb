class ForksController < ApplicationController
  def create
    @fork = ForkAddition.new(current_user, deck).create
    redirect_to [current_user, @fork]
  end

private
  def deck
    @deck ||= Deck.find_by_id params[:fork]
  end
end
