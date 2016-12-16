require 'rails_helper'

RSpec.feature "Card check", :type => :feature do

  before do
    user = FactoryGirl.create(:user)
    deck = FactoryGirl.create(:deck)
    card = FactoryGirl.create(:card)
  end

  scenario "successfully checks card" do
    visit root_path

    fill_in 'Enter original text', with: 'clean'
    click_button 'Save Check'

    expect(page).to have_text("Правильно")
  end
end
