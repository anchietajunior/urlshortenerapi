class LinksController < ApplicationController
  before_action :set_link, only: [:show, :update, :destroy]

  def index
    @links = Link.all

    render json: @links
  end

  def show
    render json: @link
  end

  def redirect
    link = Link.find_by(shortened_url: params[:id])
    if link.present?
      redirect_to link.original_url
    else
      render json: { errors: "Link not found" }, status: :unprocessable_entity
    end
  end

  def create
    result = Links::LinkCreatorService.call(User.last, link_params)

    if result.success?
      @link = result.value
      render json: { shortened_url: @link.shortened_url }, status: :created, location: @link
    else
      render json: { errors: result.error }, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.permit(:original_url, :shortened_url, :expires_at, :user_id)
  end
end
