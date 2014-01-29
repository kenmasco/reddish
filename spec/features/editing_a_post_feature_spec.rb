require 'spec_helper'

describe 'editing a story' do 
  
  before do
    story = create(:story)
    login_as story.user, scope: :user
  end

  it "can change a story's title" do
    visit '/stories'

    click_link "Edit story" 
    fill_in 'Title', with: 'A New Title'
    click_button "Submit"

    expect(page).to have_content 'A New Title'
  end

  it "a user can delete a story they created" do
    visit '/stories'
    click_link "Delete"

    expect(page).not_to have_content 'A great story'
  end


end
