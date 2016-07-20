require 'rails_helper'

describe 'the person view', type: :feature do

describe 'phone numbers in person view' do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: "555-1234")
    person.phone_numbers.create(number: "555-5678")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
  expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
end

it 'adds a new phone number' do
  page.click_link('Add phone number')
  page.fill_in('Number', with: '555-8888')
  page.click_button('Create Phone number')
  expect(current_path).to eq(person_path(person))
  expect(page).to have_content('555-8888')
end

it 'has links to edit phone numbers' do
  person.phone_numbers.each do |phone|
    expect(page).to have_link('edit', href: edit_phone_number_path(phone))
  end
end

end

describe 'email addres in person view' do

let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.email_addresses.create(address: "mprasanthk27@gmail.com")
    person.email_addresses.create(address: "prasanth.m7@tcs.com")
    visit person_path(person)
  end

  it 'shows the email addresses' do
    person.email_addresses.each do |email|
      expect(page).to have_content(email.address)
    end
  end

  it 'has a link to add a new phone number' do
  expect(page).to have_link('Add email addresses number', href: new_email_address_path(person_id: person.id))
end

it 'adds a new email address number' do
  page.click_link('Add email address')
  page.fill_in('Email', with: 'mprasanthk27@gmail.com')
  page.click_button('Create email address') 
  expect(current_path).to eq(person_path(person))
  expect(page).to have_content('mprasanthk27@gmail.com')
end

it 'has links to edit email address' do
  person.email_addresses.each do |email|
    expect(page).to have_link('edit', href: edit_email_address_path(email))
  end
end


end


end