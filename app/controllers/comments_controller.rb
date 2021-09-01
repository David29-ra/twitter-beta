class CommentsController < ApplicationController
  # GET /comments/new
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(tweet_id: @tweet.id)
  end

  # GET /comments/:id/edit
  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @tweet
  end

  # PATCH /comments/:id
  def update
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_update_params)
      flash[:success] = 'comment was successfully updated'
      redirect_to @tweet
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  # DELETE /comments/:id
  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @tweet
  end

  private

  def comment_params
    params.permit(:body, :tweet_id)
  end

  def comment_update_params
    params.require(:comment).permit(:body, :tweet_id)
  end
end
