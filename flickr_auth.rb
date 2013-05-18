require 'flickraw'

FlickRaw.api_key = "933e8bb7bee8381c46a9b3cb1e321ed6"
FlickRaw.shared_secret="99bb0541ec349ae5"

token = flickr.get_request_token(:oauth_callback => "http://defworld.com")
auth_url =  flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

puts auth_url
