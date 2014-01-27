require 'spec_helper'

describe 'upvoting & downvoting' do 

  before do
    create(:story)
  end

  specify "upvoting a story increase it's vote count" do
    visit "/stories"
    click_button 'Upvote'
    
    expect(page).to have_css '.votes_count', text: '1'
  end
    
end