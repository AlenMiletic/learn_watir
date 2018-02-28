class ZipCodeInformationService
  include SoapObject

  wsdl 'http://www.webservicex.net/uszip.asmx?WSDL'

  def response_for(key)
    message[key]
  end

  private 
  
  def message
    body[:get_info_by_zip_response][:get_info_by_zip_result][:new_data_set][:table]
  end

end
