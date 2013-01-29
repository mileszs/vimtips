class TipsController < ApplicationController
  respond_to :json, :html

  def index
    @tips = Tip.all
    respond_with @tips
  end
end
