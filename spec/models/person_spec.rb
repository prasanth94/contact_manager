require 'rails_helper'

RSpec.describe Person, type: :model do

	let(:person) do
  		Person.new(first_name: 'Alice', last_name: 'Smith')
	end

  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
  	person.first_name = 'Alice'
  	person.last_name = nil
  	expect(person).not_to be_valid
  end

  it 'is valid' do
  	person.last_name = 'Smith'
  	expect(person).to be_valid
  end

  it 'responds with its created phone numbers' do
  person.phone_numbers.build(number: '555-8888')
  expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
end

it 'responds with its created email addresses' do
  person.email_addresses.build(address: 'me@example.com')
  expect(person.email_addresses.map(&:address)).to eq(['me@example.com'])
end

end
