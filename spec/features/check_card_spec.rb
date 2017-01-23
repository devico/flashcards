require 'rails_helper'

RSpec.feature "Card check", :type => :feature do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
    @card = Card.create(original_text: 'clean',
                        translated_text: 'чистый',
                        image: 'minion.png',
                        user_id: @user.id,
                        deck_id: @deck.id,
                        review_date: Date.today)
    #sign_up(@user.username, @user.password)
  end

  # def sign_up(name, password)
  #   visit '/dashboard/users/signup?locale=en'
  #   fill_in 'User name', with: :name
  #   fill_in 'Password', with: :password
  #   fill_in 'Confirm password', with: :password
  #   click_button 'Register'
  # end

  scenario "User input correct original text, checks card and recieved message" do
    visit '/home/welcome/review'
    fill_in "Enter original text", with: 'clean'
    click_button 'Check card'
    expect(page).to have_text("Perfect answer")
  end
  
  scenario "User input not correct original text, checks card and recieved message" do
    visit root_path
    fill_in "Enter original text", with: 'cleeanm'
    click_button 'Check card'
    expect(page).to have_text("Complete blackout")
  end
end
