class GenerationsController < ApplicationController
  def index
    @generations = Generation.where(brand_id: params[:id])
    respond_to do |format|
      format.turbo_stream {}
    end
  end
end