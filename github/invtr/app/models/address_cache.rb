class AddressCache
	include Mongoid::Document
	include Mongoid::Timestamps

	field :session_id, type: String
	field :contacts, type: Array

	validates_presence_of :session_id, :contacts
end