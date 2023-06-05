class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    
  end

  def new
    @feed = Feed.new
    # @feeds = Feed.all
    @feed = Feed.new(feed_params) if params[:back]
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @feed.save
        redirect_to feeds_path, notice: "投稿制作されました"
      else
        render :new
      end
    end
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if @feed.valid?
      render :confirm
    else
      render :new
    end
  end
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_path, notice: "削除しました"
  end

  private

  def feed_params
    params.require(:feed).permit(:content, :image, :image_cache)
  end
end
