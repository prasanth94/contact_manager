require 'rails_helper'

RSpec.describe PhoneNumber, :type => :model do
  let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:phone_number) { PhoneNumber.new(number: "111-222-3333", contact_id: person.id, contact_type: 'Person') }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end

  it 'must have a reference to a contact' do
    phone_number.contact_id = nil
    expect(phone_number).not_to be_valid
  end

  it 'is associated with a contact' do
    expect(phone_number).to respond_to(:contact)
  end
end