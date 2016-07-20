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
end
