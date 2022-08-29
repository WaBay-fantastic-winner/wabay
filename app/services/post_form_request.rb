class PostFormRequest
  require 'uri'
  require 'net/http'

  def request(uri, data)
    uri = URI(uri)
    Net::HTTP.post_form(uri, data)
  end
end