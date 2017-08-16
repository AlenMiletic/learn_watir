require 'watir'
@browser = Watir::Browser.new :chrome

def goto_puppy_site
  @browser.goto "puppies.herokuapp.com"
end

def adopt_puppy_number(num)
  @browser.button(value: "View Details", index: num - 1).click
  @browser.button(value: "Adopt Me!").click
end

def adopt_another_puppy
  @browser.button(value: "Adopt Another Puppy").click
end

def checkout(name, address, email, pay_type)
  @browser.button(value: "Complete the Adoption").click
  @browser.text_field(id: "order_name").set(name)
  @browser.textarea(id: "order_address").set(address)
  @browser.text_field(id: "order_email").set(email)
  @browser.select_list(id: "order_pay_type").select(pay_type)
  @browser.button(value: "Place Order").click
end

def verify(text)
  fail unless @browser.text.include? text
end

def close_browser
  @browser.close
end
goto_puppy_site
adopt_puppy_number 1
adopt_another_puppy
adopt_puppy_number 2
checkout("Alen", "Ul.Grabrovec 151 \n49210 Zabok", "alen.miletic6@gmail.com", "Credit card")
veify("Thank you for adopting a puppy!")
close_browser
