require 'spec_helper'

describe 'editing a story' do 
  
  before do
    user = create(:user, email: 'b@b.com')
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

  it "can delete a story" do
    story = create(:story)
    visit '/stories'
    click_link "Delete"

    expect(page).not_to have_content 'A great story'
  end


end
