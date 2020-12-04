class CommentsController < ApplicationController
  before_action :find_movie

  def index
    @comments = @movie.comments.order(created_at: :desc)
  end

  def create
    @comment = @movie.comments.new(comment_params)
    @comment.user = current_user

    render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
  end

  def destroy
    @comment = @movie.comments.find(params[:id])

    if @comment.user_id == @current_user_id
      @comment.destroy
      render json: {}
    else
      render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
    end
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
