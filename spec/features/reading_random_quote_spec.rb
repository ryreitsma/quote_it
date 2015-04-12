require 'feature_spec_helper'

feature 'Reading a random quote', type: :feature do
  given!(:quote) { FactoryGirl.create(:quote) }

  context "when I visit the homepage" do
    before do
      visit '/'
    end

    specify "I can read a random quote" do
      expect(page).to have_content quote.content
    end

    specify "I see the name of author of the quote" do
      expect(page).to have_content quote.author.name
    end
  end
end