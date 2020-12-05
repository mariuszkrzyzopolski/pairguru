require "rails_helper"

describe "Leaderboard request", type: :request do
  let!(:leaderboard) { create_list(:leaderboard, 5, :with_users) }

  describe "list of users" do
    it "dispaly all users if fewer than 10" do
      visit "/leaderboard"
      expect(page).to have_selector("ol li", count: 5)
    end
  end
end
