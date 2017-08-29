require_relative "error_panel"
require_relative "side_menu_panel"
class CheckoutPage
  include PageObject
  include DataMagic
  include SideMenuPanel

  page_section(:error, ErrorPanel, id: "error_explanation")
  
  text_field(:name, id: "order_name")
  text_area(:address, id: "order_address")
  text_field(:email, id: "order_email")
  select_list(:pay_type, id: "order_pay_type")
  button(:place_order, value: "Place Order")

  def checkout(data = {})
    populate_page_with data_for(:checkout_page, data)
    place_order
  end

end
