require 'rails_helper'

describe ""




# Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading
#
# Feature:
# As a user
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
#
# As a user
# When I visit "/"
# And I fill in a text box with "foxez"
# And I click "Validate Word"
# Then I should see a message that says "'foxez' is not a valid word."
