require 'watir'
require_relative 'adoption_helper'


include AdoptionHelper

goto_puppy_site
adopt_puppy_number 1
adopt_another_puppy
adopt_puppy_number 2
checkout("Alen", "Ul.Grabrovec 151 \n49210 Zabok", "alen.miletic6@gmail.com", "Credit card")
verify("Thank you for adopting a puppy!")
close_browser
