class StarsController < ApplicationController
  before_filter :deck

  def index
    @stars = deck.stars
  end

  def create
    @star = StarAddition.new(current_user, deck).process
    render layout: false
  end

private
  def deck
    @deck ||= Deck.find_by_id params[:deck_id]
  end
end
