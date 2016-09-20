require 'rails_helper'

RSpec.describe 'User can search for stores by zip code' do
  it 'returns 15 out of 17 stores in zip code' do
    visit '/'

    fill_in 'zip', with: '80202'
    click_on 'Search'

    expect(current_path).to eq('/search')

    within('#results') do
      expect(page).to have_content('17 Total Stores')
      expect(page).to have_content('Displaying 15 Stores')

      expect(page).to have_selector('.results', count: 15)

      within('#result-1') do
        expect(page).to have_content('Best Buy Mobile - Cherry Creek Shopping Center')
        expect(page).to have_content('Denver')
        expect(page).to have_content('3.25')
        expect(page).to have_content('303-270-9189')
        expect(page).to have_content('Mobile')
      end
    end
  end
end
