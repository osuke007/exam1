class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
#    @tweets = Tweet.all
    @tweets=Tweet.order("updated_at desc")
#    @tweets = Tweet.find(:all, :order => "id")
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def edit
    #@tweet = Tweet.find(params[:id])
  end
  
  def destroy
    #@tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました。"
  end
  
  def update
    #@tweet = Tweet.find(params[:id])
    @tweet.update(tweets_params)
    if @tweet.save 
      redirect_to tweets_path, notice: "更新しました！"
    else
      render 'edit'
    end
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end

  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.save 
      redirect_to tweets_path, notice: "Tweetしました！"
    else
      render 'new'
    end
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    
end
