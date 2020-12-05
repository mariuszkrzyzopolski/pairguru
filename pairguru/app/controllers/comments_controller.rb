class CommentsController < ApplicationController
  def index
    @comments = @movie.comments.order(created_at: :desc)
  end

  def create
    if have_comment? params[:movie_id]
      render :err
    else
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @comment.movie_id = params[:movie_id]
      @comment.save
      redirect_to movie_path(@comment.movie)
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @movie = find_movie params[:movie_id]

    if @comment.user_id == current_user.id
      @comment.destroy
    end
    redirect_to movie_path(@movie)
  end

  def have_comment? movie_id
    @movie = find_movie movie_id
    return false if @movie.comments.all.empty?
    @movie.comments.reverse.each do |comment|
      return true if comment.user_id == current_user.id
    end
    false
  end

  def find_movie(movie_id)
    @movie = Movie.find(movie_id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
