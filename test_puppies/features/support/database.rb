require 'active_record'
require 'database_cleaner'
require 'factory_girl'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3'
  databaase: '../puppies/db/development.sqlite3')
