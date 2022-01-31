# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  # integration tests for title
  scenario 'valid inputs for title' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    #visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid inputs for title' do
    visit new_book_path
    fill_in 'Title', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  #integration tests for author
  scenario 'valid inputs for author' do
    visit new_book_path
    fill_in 'Author', with: 'J.K. Rowling'
    click_on 'Create Book'
    expect(page).to have_content('J.K. Rowling')
  end

  scenario 'invalid inputs for author' do
    visit new_book_path
    fill_in 'Author', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  #integration tests for price
  scenario 'valid inputs for price' do
    visit new_book_path
    fill_in 'Price', with: 5.00
    click_on 'Create Book'
    expect(page).to have_content(5.00)
  end

  scenario 'invalid inputs for price' do
    visit new_book_path
    fill_in 'Price', with: 0
    click_on 'Create Book'
    expect(page).to have_content("Book can't be free")
  end

  #integration tests for date
  scenario 'valid inputs for date' do
    visit new_book_path
    fill_in 'Date', with: "%1/%30/%2022"
    click_on 'Create Book'
    expect(page).to have_content("%1/%30/%2022")
  end

  scenario 'invalid inputs for month' do
    visit new_book_path
    fill_in 'Date', with: "%13/%30/%2022"
    click_on 'Create Book'
    expect(page).to have_content("Book must have valid date")
  end

  scenario 'invalid inputs for day' do
    visit new_book_path
    fill_in 'Date', with: "%1/%35/%2022"
    click_on 'Create Book'
    expect(page).to have_content("Book must have valid date")
  end

  scenario 'invalid inputs for year' do
    visit new_book_path
    fill_in 'Date', with: "%1/%30/%2025"
    click_on 'Create Book'
    expect(page).to have_content("Book must have valid date")
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

