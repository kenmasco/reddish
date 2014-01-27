require 'spec_helper'

describe 'editing a story' do 
  

  it "can change a story's title" do
    user = User.new(email:"a@a.com", password: "12345678")
    story = Story.new(title: "blabla", link: "http://yo.com")
    story.user = user
    story.save
    visit '/stories'

    click_link "Edit story" 
    fill_in 'Title', with: 'A New Title'
    click_button "Submit"

    expect(page).to have_content 'A New Title'
  end

  it "can delete a story" do
        user = User.new(email:"a@a.com", password: "12345678")
    story = Story.new(title: "blabla", link: "http://yo.com")
    story.user = user
    story.save
    visit '/stories'
    click_link "Delete"

    expect(page).not_to have_content 'A great story'
  end


end
