class MtgSetsController < ApplicationController
  respond_to :js

  def show
    @mtg_set = MtgSet.find params[:id]
    render layout: false
  end
end
