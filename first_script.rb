require 'watir'
browser = Watir::Browser.new :firefox
browser.goto 'http://www.apple.com'
browser.close
