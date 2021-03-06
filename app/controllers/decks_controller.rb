class DecksController < ApplicationController
  before_filter :require_user, only: [:create, :destroy]

  def index
    @deck = Deck
  end

  def new
    @deck = current_user.decks.new
  end

  def edit
    @mtg_sets = MtgSet.all
    @deck = current_user.decks.find_by_id(params[:id]).decorate
  end

  def create
    @deck = current_user.decks.build deck_params
    if @deck.save
      redirect_to edit_user_deck_url current_user, @deck
    else
      render :new
    end
  end

  def destroy
    @deck = current_user.decks.find_by_id params[:id]
    @deck.destroy
    redirect_to current_user
  end

  def show
    @deck = Deck.find_by_id(params[:id]).decorate
  end

  def comments
    @deck = Deck.find_by_id(params[:deck_id]).decorate
  end

private
  def deck_params
    params.require(:deck).permit(:title, :format, :tags, :colors)
  end

  def user
    @user ||= User.find_by_id params[:user_id]
  end
end
