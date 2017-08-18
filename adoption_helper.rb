module AdoptionHelper
def goto_puppy_site
  @browser = Watir::Browser.new :firefox
  @browser.goto "puppies.herokuapp.com"
end

def adopt_puppy_number(num)
  sleep 2
  @browser.button(value: "View Details", index: num - 1).click
  sleep 2
  @browser.button(value: "Adopt Me!").click
end

def adopt_another_puppy
  sleep 2
  @browser.button(value: "Adopt Another Puppy").click
end

def checkout(name, address, email, pay_type)
  sleep 1
  @browser.button(value: "Complete the Adoption").click
  sleep 2
  @browser.text_field(id: "order_name").set(name)
  @browser.textarea(id: "order_address").set(address)
  @browser.text_field(id: "order_email").set(email)
  @browser.select_list(id: "order_pay_type").select(pay_type)
  @browser.button(value: "Place Order").click
end

def verify(text)
  sleep 2
  fail unless @browser.text.include? text
end

def close_browser
  sleep 1
  @browser.close
end
end
