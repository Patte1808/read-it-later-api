class LinksController < ApplicationController
  before_action :set_link, only: [:show, :update, :destroy]
  before_filter :authenticate_request!

  # GET /links
  def index
    @user = current_user
    @links = @user.links.all

    render json: @links
  end

  # GET /links/1
  def show
    render json: @link
  end

  # POST /links
  def create
    @user = current_user
    @link = Link.new(link_params)

    @link.user = @user

    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  def destroy
    if @link.destroy
      render json: { id: params[:id] }, status: 200
    else
      render status: 500
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def link_params
      params.require(:link).permit(:title, :notes)
    end
end
