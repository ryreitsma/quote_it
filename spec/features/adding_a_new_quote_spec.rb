require 'feature_spec_helper'

feature "Adding a quote", type: :feature do
  given(:authors) { Author.all }

  before do
    3.times{ FactoryGirl.create(:author)}
  end

  context "when I visit the list of quotes" do
    before do
      visit '/quotes'
    end

    context "and I click on the 'Add new quote' button" do
      before do
        click_on 'Nieuwe quote toevoegen'
      end

      specify "I see an input field where I can write a quote" do
        expect(page).to have_field('Quote')
      end

      specify "I see a select box where I can choose an author" do
        expect(page).to have_select('Auteur', options: authors.pluck(:name))
      end

      context "when I write a quote and select an author" do
        given(:content) { Faker::Hacker.say_something_smart }

        before do
          fill_in('Quote', with: content)
          select(Author.last.name, from: 'Auteur')
        end

        context "and I click save" do
          before do
            click_on 'Quote opslaan'
          end

          specify "I see a message that a new quote was added" do
            expect(page).to have_content('Quote is toegevoegd')
          end

          specify "I see the new quote in the list" do
            expect(page).to have_content(content)
          end
        end

        context "and I click cancel" do
          before do
            click_on 'Annuleren'
          end

          specify "I do not see the new quote in the list" do
            expect(page).not_to have_content(content)
          end
        end
      end
    end
  end
end