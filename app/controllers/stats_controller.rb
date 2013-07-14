class StatsController < ApplicationController
  before_filter :deck

  def index
  end

private
  def deck
    @deck ||= Deck.find_by_id(params[:deck_id]).decorate
  end
end
