# location: spec/feature/integration_spec.rb
require 'rails_helper'

# CREATE
RSpec.describe 'Creating a book', type: :feature do
  # integration tests for title
  scenario 'valid inputs for title' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    click_on 'Create Book'
    visit items_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid inputs for title' do
    visit new_item_path
    fill_in 'Title', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  #integration tests for author
  scenario 'valid inputs for author' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    click_on 'Create Book'
    expect(page).to have_content('J.K. Rowling')
  end

  scenario 'invalid inputs for author' do
    visit new_item_path
    fill_in 'Author', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  #integration tests for price
  scenario 'valid inputs for price with regular price' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    click_on 'Create Book'
    expect(page).to have_content(5.50)
  end

  scenario 'valid inputs for price with int' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 9
    click_on 'Create Book'
    expect(page).to have_content(9.0)
  end
  
  scenario 'valid inputs for price - free' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 0
    click_on 'Create Book'
    expect(page).to have_content(0.0)
  end

  scenario 'invalid inputs for price' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'invalid inputs with negative price' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: -5.50
    click_on 'Create Book'
    expect(page).to have_content("Price must be greater than or equal to 0")
  end

  scenario 'rounding price' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 20.647
    click_on 'Create Book'
    expect(page).to have_content(20.65)
  end

  #integration tests for date
  scenario 'valid inputs for date' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    fill_in 'Date', with: "%1/%30/%2022"
    click_on 'Create Book'
    expect(page).to have_content("%1/%30/%2022")
  end

  scenario 'invalid inputs for month' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    fill_in 'Date', with: "%13/%30/%2022"
    click_on 'Create Book'
    expect(page).to have_content("Book must have valid date")
  end

  scenario 'invalid inputs for day' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    fill_in 'Date', with: "%1/%35/%2022"
    click_on 'Create Book'
    expect(page).to have_content("Book must have valid date")
  end

  scenario 'invalid inputs for year' do
    visit new_item_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 5.50
    fill_in 'Date', with: "%1/%30/%2025"
    click_on 'Create Book'
    expect(page).to have_content("Book must have valid date")
  end
end

# UPDATING
RSpec.describe 'Updating a book', type: :feature do
  scenario 'valid inputs' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit edit_item_path(id: bookThief.id)
    fill_in 'Title', with: 'Harry Potter'
    click_on 'Update Book'
    visit items_path 
    expect(page).to have_content('Harry Potter')
  end

  scenario 'invalid title input' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit edit_item_path(id: bookThief.id)
    fill_in 'Title', with: ''
    click_on 'Update Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'invalid author input' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit edit_item_path(id: bookThief.id)
    fill_in 'Author', with: ''
    click_on 'Update Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'invalid price input blank' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit edit_item_path(id: bookThief.id)
    fill_in 'Price', with: ''
    click_on 'Update Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'invalid price input negative' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit edit_item_path(id: bookThief.id)
    fill_in 'Price', with: -5.78
    click_on 'Update Book'
    expect(page).to have_content("Price must be greater than or equal to 0")
  end
end

# DELETING
RSpec.describe 'Deleting a book', type: :feature do
  scenario 'successful' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit delete_item_path(id: bookThief.id)
    click_on 'Delete Book'
    visit items_path
    expect(page).to_not have_content("book thief")
  end
end

# SHOW
RSpec.describe 'Show a book', type: :feature do
  scenario 'correct book' do
    bookThief = Item.create!(title: 'book thief', author: 'mark zusak', price: 5.50)
    visit item_path(id: bookThief.id)
    expect(page).to have_content("book thief")
  end  
end

