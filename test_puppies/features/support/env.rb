require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'
require 'factory_girl'
require 'nokogiri'
require 'builder'
require 'soap-object'

require_all 'lib'

World(PageObject::PageFactory)
World(FactoryGirl::Syntax::Methods)
World(SoapObject::Factory)
