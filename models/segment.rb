class Segment < ActiveRecord::Base
	serialize :options, JSON
end