module Api
  class ContentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_content, only: %i[ show edit update destroy ]

    def index
      @contents = Content.all
    end

    def show; end

    def new
      @content = Content.new
    end

    def edit; end

    def create
      @content = Content.new(content_params)

      if @content.save
        render 'api/contents/index', status: :created, location: @content
      else
        render json: @content.errors, status: :unprocessable_entity
      end
    end

    def update
      if @content.update(content_params)
        render 'api/contents/index', status: :ok, location: @content
      else
        render json: @content.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @content.destroy

      head :no_content
    end

    private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:name, :description)
    end
  end
end
