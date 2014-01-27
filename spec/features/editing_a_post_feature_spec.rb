require 'spec_helper'

describe 'editing a story' do 
  
  before do
    create(:story)
    visit '/stories'
  end

  it "can change a story's title" do
    click_link "Edit story" 
    fill_in 'Title', with: 'A New Title'
    click_button "Submit"

    expect(page).to have_content 'A New Title'
  end

  it "can delete a story" do
    click_link "Delete"

    expect(page).not_to have_content 'A great story'
  end


end
