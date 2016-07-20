require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
 let(:email_address) { EmailAddress.new(address: "mprasanthk27@gmail.com", person_id: 1) }

 	it "is valid" do
 		expect(email_address).to be_valid
	end

	it "is not valid without address" do
		email_address.address = nil
		expect(email_address).not_to be_valid
	end

	it "must have a reference to a person" do
		email_address.person_id = nil
		expect(email_address).not_to be_valid
	end

	it 'is associated with a person' do
  		expect(email_address).to respond_to(:person)
	end

end
