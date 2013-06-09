class SuggestionsController < ApplicationController
  before_filter :suggestion, only: [:new, :create]

  def new
  end

  def index
    @suggestions ||= deck.suggestions.open
  end

  def create
    suggestion.assign_attributes suggestion_params
    if suggestion.save
      redirect_to [deck.origin, suggestion]
    else
      render :new
    end
  end

  def update
    suggestion = deck.suggestions.find_by_id params[:id]
    SuggestionAddendum.new(deck, suggestion).process
    suggestion.close
    redirect_to edit_user_deck_url(deck.user, deck)
  end

  def show
    @suggestion = deck.suggestions.find_by_id(params[:id]).decorate
  end

  def destroy
    suggestion = deck.suggestions.find_by_id params[:id]
    suggestion.close
    redirect_to [deck.user, deck]
  end

private
  def suggestion_params
    params.require(:suggestion).permit(:title, :content)
  end

  def deck
    @deck ||= Deck.find_by_id(params[:deck_id]).decorate
  end

  def suggestion
    @suggestion ||=
      SuggestionCreator.new(current_user, deck, deck.origin).process
  end
end
