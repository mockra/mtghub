class StarsController < ApplicationController
  before_filter :deck
  before_filter :require_user, only: :create

  def index
    @stars = deck.stars
  end

  def create
    @star = StarAddition.new(current_user, deck).process
    render layout: false
  end

private
  def deck
    @deck ||= Deck.find_by_id(params[:deck_id]).decorate
  end
end
