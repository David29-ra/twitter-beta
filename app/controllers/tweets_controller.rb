class TweetsController < ApplicationController
  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/:id
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/:id/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      flash[:success] = 'Object successfully created'
      redirect_to @tweet
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  # PATCH /tweets/:id
  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      flash[:success] = 'Tweet was successfully updated'
      redirect_to @tweet
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  # DELETE /tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])

    if @tweet.destroy
      flash[:success] = 'Tweet was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
