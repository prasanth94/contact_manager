class PhoneNumber < ActiveRecord::Base
	belongs_to :contact, polymorphic: true
	validates :number,:person_id, presence: true
end
