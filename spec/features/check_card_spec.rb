require 'rails_helper'

RSpec.feature "Card check", :type => :feature do

  before do
    user = FactoryGirl.create(:user)
    deck = FactoryGirl.create(:deck)
    card = Card.create(original_text: 'clean', 
                       translated_text: 'чистый', 
                       image: 'minion.png'
                )
  end

  scenario "successfully checks card" do
    visit root_path

    fill_in 'Enter original text', with: 'clean'
    click_button 'Save Check'

    expect(page).to have_text("Правильно")
  end
end
