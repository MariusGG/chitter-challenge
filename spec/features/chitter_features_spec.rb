require 'Chitter'


describe Chitter do

  feature 'Add peep' do
    scenario 'user sends a peep' do
    visit('/')
    fill_in 'peep', with: "I like pizza"
    click_button 'Peep it!'
    expect(page).to have_content "I like pizza"
    end
  end

  feature 'Posting Peeps' do
  scenario 'I want to post a peep to chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter ; )'

    click_link 'Sign In'
    fill_in :username, with: 'Mariusgg14'

    click_button 'Sign In'
    expect(page).to have_link 'Mariusgg14'
    fill_in :peep, with: 'I want pizza'

    click_button 'Peep It!'
    expect(page).to have_content "[\"Mariusgg14\"] I want pizza"

    end
  end

  feature 'Sign out' do
    scenario 'user can sign out of their account' do
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
