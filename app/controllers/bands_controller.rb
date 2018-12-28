class BandsController < ApplicationController
  before_action :set_requested_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def new
    @requested_band = Band.new
  end

  def create
    @new_band = Band.create(band_params)
  end

  def show
    @members = @requested_band.members
  end

  private

  def set_requested_band
    @requested_band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:description, :manager)
  end
end
