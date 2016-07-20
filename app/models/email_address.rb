class EmailAddress < ActiveRecord::Base
	belongs_to :person

	validates :address, :person_id, presence: true
end
