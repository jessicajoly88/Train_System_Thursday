require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe('train system app',{:type => :feature}) do

  describe('adding a new train') do
    it('allows a user to click a link to fill out a form to add a new train') do
      visit('/')
      click_link('Add a New Train')
      fill_in('name', :with => 'Morning Train')
      click_button('Add Train')
      expect(page).to have content('Welcome to the Train System')
    end
  end

  describe('takes you to specific train page') do
    it('allows a user to click on the link for a specific train to get more information') do
      train = Train.new({:name => 'Hogwarts', :id => nil})
      train.save()
      visit('/')
      click_link(train.name)
      expect(page).to have_content(train.name())
    end

    it('allows the user to click on a link to get back to index page') do
      train = Train.new({:name => 'Hogwarts', :id => nil})
      train.save()
      visit("/trains/#{train.id}")
      click_link('Go Back to the Home Page')
      expect(page).to have_content('Welcome to the Train System')
    end
  end  

end
