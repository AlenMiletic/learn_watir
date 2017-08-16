require 'watir'
@browser = Watir::Browser.new :chrome

def adopt_puppy_number(num)
  @browser.button(value: "View Details", index: num - 1).click
  @browser.button(value: "Adopt Me!").click
end

@browser.goto 'puppies.herokuapp.com'
adopt_puppy_number 1
@browser.button(value: "Adopt Another Puppy").click
adopt_puppy_number 2
@browser.button(value: "Complete the Adoption").click
@browser.text_field(id: "order_name").set("Alen")
@browser.textarea(id: "order_address").set("Ul.Grabrovec 151 \n 49210 Zabok")
@browser.text_field(id: "order_email").set("alen.miletic6@gmail.com")
@browser.select_list(id: "order_pay_type").select("Credit card")
@browser.button(value: "Place Order").click
fail "Browser text did not match expected value" unless @browser.text.include? "Thank you for adopting a puppy!"
@browser.close
