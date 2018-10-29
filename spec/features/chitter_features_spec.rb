require 'Chitter'


describe Chitter do

  # describe '.all' do
  #   it 'returns all peeps' do
  #     chitters = Chitter.all
  #     expect(chitters).to include("Chilling at home")
  #     expect(chitters).to include("On my way to the pool")
  #     expect(chitters).to include("I want pizza!")
  #
  #   end
  # end

  feature 'Posting Peeps' do
  scenario 'I want to post a message (peep) to chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'

    click_link 'Sign In'
    fill_in :username, with: 'Mariusgg14'

    click_button 'Sign In'
    expect(page).to have_link 'Mariusgg14'
    fill_in :peep, with: 'I want pizza'

    click_button 'PeepIt!'
    expect(page).to have_content "[\"Mariusgg14\"] I want pizza"

    end
  end

  feature 'Sign out' do
    scenario 'user signs out' do
      visit '/'
      click_link 'Sign In'
      fill_in :username, with: 'Mariusgg14'

      click_button 'Sign In'

      click_link 'Mariusgg14'

      click_button 'Sign Out'
      expect(page).not_to have_content('Mariusgg14')
      expect(page).to have_content('Sign In')
    end
  end

end
