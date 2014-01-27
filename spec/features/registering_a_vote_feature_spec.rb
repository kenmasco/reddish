require 'spec_helper'

describe 'upvoting & downvoting' do 

  specify "upvoting a story increase it's vote count" do
    click_link 'Upvote'
    expect(page).to have_css '.votes_count', text: '1'
  end
    
end