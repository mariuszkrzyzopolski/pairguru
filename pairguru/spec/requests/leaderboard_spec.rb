require "rails_helper"

describe "Leaderboard request", type: :request do
  describe "list of users fewer than 10" do
    let!(:leaderboard) { create_list(:user, 5, :with_comments) }
    it {
      visit "/leaderboard"
      expect(page).to have_selector("ol li", count: 5)
    }
  end
  
  describe "list of users larger than 10" do
  let!(:leaderboard) { create_list(:user, 15, :with_comments) }
  it {
    visit "/leaderboard"
    expect(page).to have_selector("ol li", count: 10)
  }
  end
end
