# require('capybara/rspec')
# require('./app')
# require('spec_helper')
# Capybara.app = Sinatra::Application
# set(:show_exceptions,false)
#
# describe('train system app',{:type => :feature}) do
#
#   describe('adding a new train') do
#     it('allows a user to click a link to fill out a form to add a new train') do
#       visit('/')
#       click_link('Add a New Train')
#       fill_in('name', :with => 'Morning Train')
#       fill_in('city', :with => 'Tokyo')
#       click_button('Add Train')
#       expect(page).to have content('Success!')
#     end
#   end
#
# end
