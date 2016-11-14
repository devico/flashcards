require 'rails_helper'

RSpec.feature "Card check", :type => :feature do

  before do
    card = FactoryGirl.create(:card)
    user = FactoryGirl.create(:user)
  end

  scenario "successfully checks card" do
    visit root_path

    fill_in 'Enter original text', with: 'cloud'
    click_button 'Save Check'

    expect(page).to have_text('Правильно')
  end
end
