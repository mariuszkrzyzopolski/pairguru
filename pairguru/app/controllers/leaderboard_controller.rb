class LeaderboardController < ApplicationController
  def index
    @leaderboard = User.joins(:comments).where('comments.created_at >= ?', 1.week.ago.utc).group(:id).order("count(*) desc").limit(10)
  end
end
