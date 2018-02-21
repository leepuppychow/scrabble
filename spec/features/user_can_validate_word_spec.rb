require 'rails_helper'

# Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading


describe "As a user when I visit the '/' path" do
  context "And I fill in a text box with foxes and click Validate Word" do
    it "should see that foxes is valid and its root form is fox" do
      VCR.use_cassette("word-validate-foxes") do
        visit '/'

        fill_in "word", with: "foxes"
        click_on "Validate Word"

        expect(page).to have_content "foxes is a valid word"
        expect(page).to have_css(".root-form")
        within(".root-form") do
          expect(page).to have_content "fox"
        end
      end

    end
  end

  context "and I fill in a text box with foxez and click Validate Word" do
    it "should see that foxez is not a valid word" do
      VCR.use_cassette("foxez") do
        visit '/'

        fill_in "word", with: "foxez"
        click_on "Validate Word"

        expect(page).to have_content "foxez is not a valid word"
      end
    end
  end
end
