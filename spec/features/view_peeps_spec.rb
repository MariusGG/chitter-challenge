feature 'view all peeps' do
  scenario 'view peeps posted' do
    visit('/peeps')
    expect(page).to have_content "Chilling at home"
    expect(page).to have_content "On my way to the pool"
    expect(page).to have_content "I want pizza!"
  end
end
