require 'spec_helper'

describe 'editing a story' do 
  
  before do
    user = create(:user)
    login_as user, scope: :user
  end

  it "can change a story's title" do
    story = create(:story)
    visit '/stories'

    click_link "Edit story" 
    fill_in 'Title', with: 'A New Title'
    click_button "Submit"

    expect(page).to have_content 'A New Title'
  end

  it "a user can delete a story they created" do
    story = create(:story)
    visit '/stories'
    click_link "Delete"

    expect(page).not_to have_content 'A great story'
  end


end
