require_relative '../rails_helper'

RSpec.describe 'Search input', type: :feature, js: true do
  it 'sends a request after user has stopped typing for 9 seconds' do
    visit '/searches/search'

    fill_in 'search', with: 'rspec'

    sleep 4

    fill_in 'search', with: 'rspec integration tests'

    sleep 9

    # Check if request was sent

    expect(Search.last.sentence).to eq('rspec integration tests')
  end
end
