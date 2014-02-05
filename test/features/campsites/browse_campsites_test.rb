require "test_helper"

feature "BrowseCampsites" do
  scenario "As a visitor I want to browse campsites so
  that I can find the most recently rated campsites." do
    #given the campsite index page
    visit root_path
    #when I browse campsites
    page.must_have_selector('table tr', :count => Campsite.all.count + 1)
    #then I find the highest rated campsites
    @recent_campsite = Rating.order(:created_at).last.campsite
    page.find('tbody tr[1] td[7]').text.must_include(@recent_campsite.name)
    page.find('tbody tr[1] td[8]').text.must_include(@recent_campsite.latitude.to_s)
    page.find('tbody tr[1] td[9]').text.must_include(@recent_campsite.longitude.to_s)
  end

  scenario "As a visitor I want to see a map of all the campsite locations
  so that I know where it is located." do
    #given a visitor
    #when I browse the home page
    visit root_path
    #then I will see a map on the home page
    page.must_have_selector('#map')
  end

  scenario "As a visitor I want to see a map of the campsite location
  so that I know where it is located." do
    #given a campsite index page
    visit root_path
    #when I browse to the first campsite's show page
    page.find('a', text: "Show")[0].click
    #then I will see the campsite's name and a map of its location
    page.text.must_include(campsites(:good_campsite).name)
    page.must_have_selector('#map')
  end
end
