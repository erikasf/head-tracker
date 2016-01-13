class Log
	include Mongoid::Document
	include Mongoid::Timestamps
	include Geocoder::Model::Mongoid
	geocoded_by :ip
	after_validation :geocode
	field :coordinates, :type => Array


	field :type, type: String
	field :action, type: String
	field :data, type: String
	field :ip, type: String
	field :invite_id, type: String

	validates_presence_of :type, :action, :data

	def self.add_log type, action, data
		Log.create(type: type, action: action, data: data)
	end

end