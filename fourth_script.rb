require 'watir'
browser = Watir::Browser.new :chrome
browser.goto 'puppies.herokuapp.com'
sleep 5
browser.button(value: "View Details", index: 1).click
sleep 2
browser.button(value: "Adopt Me!").click
sleep 2
browser.button(value: "Complete the Adoption").click
sleep 2
browser.text_field(id: "order_name").set("Alen")
browser.textarea(id: "order_address").set("Ul.Grabrovec 151 \n 49210 Zabok")
browser.text_field(id: "order_email").set("alen.miletic6@gmail.com")
browser.select_list(id: "order_pay_type").select("Credit card")
browser.button(value: "Place Order").click
sleep 5
fail "Browser text did not match expected value" unless browser.text.include? "Thank you for adopting a puppy!"
browser.close
