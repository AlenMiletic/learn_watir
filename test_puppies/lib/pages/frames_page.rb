class FramesPage
  include PageObject

  page_url "http://puppies.herokuapp.com/frames.html"

  in_frame(:id => 'frame_1') do |frame|
    text_field(:sender, :id => 'senderElement', :frame => frame)
    button(:send_to_receiver, :id => 'send', :frame => frame)
  end

  in_frame(:id => 'frame_2') do |frame|
    text_field(:receiver, :name => 'recieverElement', :frame => frame)
  end

  def send_message(message)
    self.sender = message
    send_to_receiver
  end
end
