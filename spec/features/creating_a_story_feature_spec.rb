require 'spec_helper'

describe "creating stories" do
  
  before do
    user = create(:user)
    login_as user, scope: :user
  end

  it 'should display the new story on the list of stories' do
    visit '/stories/new'
    fill_in 'Title', with: 'A great story'
    fill_in 'Link', with: "http://#"
    
    click_button 'Submit'

    expect(current_path).to eq '/stories'
    expect(page).to have_content 'A great story'
  end 

end