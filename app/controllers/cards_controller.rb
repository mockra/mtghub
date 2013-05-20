class CardsController < ApplicationController
  respond_to :js

  def create
    if type == 'sideboard'
      deck.sideboard.cards << card
    else
      deck.cards << card
    end
    render layout: false
  end

  def destroy
    CardsDeck.where(card_id: card.id, deck_id: deck.id).first.destroy
    render layout: false
  end

private
  def deck
    @deck ||= current_user.decks.find_by_id params[:deck_id]
  end

  def card
    @card ||= Card.find_by_id params[:id]
  end

  def type
    @type ||= params[:type]
  end
end
