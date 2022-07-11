module Api
  class SpecialContentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_special_content, only: %i[ show edit update destroy ]

    def index
      @special_contents = SpecialContent.all
    end

    def show; end

    def new
      @special_content = SpecialContent.new
    end

    def edit; end

    def create
      @special_content = SpecialContent.new(special_content_params)

      if @special_content.save
        @contents = Content.all
        render 'api/special_contents/index', status: :created, location: @special_content
      else
        render json: @special_content.errors, status: :unprocessable_entity
      end

    end

    def update

      if @special_content.update(special_content_params)
        render 'api/special_contents/index', status: :ok, location: @special_content
      else
        render json: @special_content.errors, status: :unprocessable_entity
      end

    end

    def destroy
      @special_content.destroy

      head :no_content
    end

    private

    def set_special_content
      @special_content = SpecialContent.find(params[:id])
    end

    def special_content_params
      params.require(:special_content).permit(:name, :description)
    end
  end
end
