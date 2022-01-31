# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  # integration tests for title
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'Title', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end
end

RSpec.describe 'Updating a book', type: :feature do
  scenario 'valid inputs' do
    bookThief = Book.create!(title: 'book thief')
    visit edit_book_path(id: bookThief.id)
    fill_in 'Title', with: 'Book Thief'
    click_on 'Update Book'
    visit books_path 
    expect(page).to have_content('Book Thief')
  end
end

