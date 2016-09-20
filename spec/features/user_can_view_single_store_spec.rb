require 'rails_helper'

RSpec.describe 'User can see a specific store page' do
  it 'displays the show page for the specific store' do
    visit '/'

    fill_in 'zip', with: '80202'
    click_on 'Search'

    click_on 'Best Buy Mobile - Cherry Creek Shopping Center'

    expect(current_path).to eq('/stores/2740')

    expect(page).to have_content('Best Buy Mobile - Cherry Creek Shopping Center')
    expect(page).to have_content('Mobile')
    expect(page).to have_content('3000 East First Ave, Denver, CO 80206')

    within ".schedule" do
      expect(page).to have_content("Mon: 10am-9pm")
      expect(page).to have_content("Tue: 10am-9pm")
      expect(page).to have_content("Wed: 10am-9pm")
      expect(page).to have_content("Thurs: 10am-9pm")
      expect(page).to have_content("Fri: 10am-9pm")
      expect(page).to have_content("Sat: 10am-9pm")
      expect(page).to have_content("Sun: 11am-7pm")
    end
  end
end
