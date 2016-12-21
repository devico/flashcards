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
    sign_up(@user.username, @user.password)
  end

  scenario "successfully checks card" do
    visit root_path

    fill_in 'Enter original text', with: @card.original_text
    click_button 'Save Check'

    expect(page).to have_text("Правильно")
  end

  def sign_up(name, password)
    visit '/users/new'
    fill_in 'Username', with: name
    fill_in 'Password', with: password
    fill_in 'Confirm password', with: password
    click_button 'Create User'
  end
end
