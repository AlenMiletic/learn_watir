require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'
require 'factory_girl'
require 'nokogiri'
require 'builder'

require_all 'lib'

World(PageObject::PageFactory)
World(FactoryGirl::Syntax::Methods)
