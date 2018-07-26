require 'active_record'

options = {
	adapter:'postgresql',
	database: 'murder_mystery'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)