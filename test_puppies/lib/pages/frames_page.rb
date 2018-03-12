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

  def alert_text
    in_frame(:id => 'frame_3') do |frame|
      @alert_text = alert(frame) do
        button_element(:id => 'alert_button', :frame => frame).click
      end
    end
    @alert_text
  end

  def confirm_text
    in_frame(:id => 'frame_3') do |frame|
        @confirm_text = confirm(true, frame) do
        button_element(:id => 'confirm_button', :frame => frame).click
      end
    end
    @confirm_text
  end
end
