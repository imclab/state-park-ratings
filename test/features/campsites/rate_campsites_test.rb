require "test_helper"

feature "RateCampsites" do
  scenario "As a visitor I want to rate campsites so that
  others may find a well ranked campsite." do
    #given I visit the campsite show page
    visit campsite_path
    #when I  a campsite with a number and comment
    fill_in 'Rating', :with => '5'
    fill_in 'Comment', :with => 'This is a great campsite!'
    #then I may be redirected to the campsite show page
    click_on 'Create Rating'
  end
end
