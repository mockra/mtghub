class Api::V1::MtgSetsController < ApplicationController
  respond_to :json

  def show
    @mtg_set = MtgSet.where("lower(title) = ?", params[:id].downcase)
    respond_with @mtg_set
  end
end
