class Api::V1::NewsController < ApplicationController
  before_action :set_news, only: [:show]
  before_action :ensure_json_request
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end
end
