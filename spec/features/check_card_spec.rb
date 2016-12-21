require 'rails_helper'

RSpec.feature "Card check", :type => :feature do

  before do
    @user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @deck = FactoryGirl.create(:deck, user_id: @user.id)
    @card = Card.create(original_text: 'clean',
                        translated_text: 'чистый',
                        image: 'minion.png',
                        user_id: @user.id,
                        deck_id: @deck.id,  
                        review_date: Date.today)
  end

  scenario "successfully checks card" do
    visit root_path

    fill_in 'Enter original text', with: @card.original_text
    click_button 'Save Check'

    expect(page).to have_text("Правильно")
  end
end
