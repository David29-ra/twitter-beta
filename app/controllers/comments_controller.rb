class CommentsController < ApplicationController
  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/:id
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/:id/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = 'Object successfully created'
      redirect_to @comment
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  # PATCH /comments/:id
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = 'comment was successfully updated'
      redirect_to @comment
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:success] = 'comment was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
