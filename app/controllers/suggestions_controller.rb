class SuggestionsController < ApplicationController
  before_filter :suggestion, only: [:new, :create]

  def new
  end

  def create
    suggestion.assign_attributes suggestion_params
    if suggestion.save
      redirect_to suggestion
    else
      render :new
    end
  end

  def show
    @suggestion = Suggestion.find_by_id params[:id]
  end

private
  def suggestion_params
    params.require(:suggestion).permit(:title, :content)
  end

  def deck
    @deck ||= Deck.find_by_id params[:deck_id]
  end

  def suggestion
    @suggestion ||=
      SuggestionCreator.new(current_user, deck, deck.origin).process
  end
end
