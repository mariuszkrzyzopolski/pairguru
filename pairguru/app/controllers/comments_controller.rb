class CommentsController < ApplicationController
  def index
    @comments = @movie.comments.order(created_at: :desc)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.movie_id = params[:movie_id]

    if have_comment? @comment.movie_id
      @comment.save
      redirect_to movie_path(@comment.movie)
    else
      render :err and return
    end

  end

  def destroy
    @comment = @movie.comments.find(params[:id])

    if @comment.user_id == current_user_id
      @comment.destroy
    end
  end

  def have_comment? movie_id
    @movie = Movie.find(movie_id)
    @movie.comments.reverse.each do |comment|
      true if comment.user_id.eql? current_user.id
    end
    false
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
