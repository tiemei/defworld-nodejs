require 'flickraw'

FlickRaw.api_key = "933e8bb7bee8381c46a9b3cb1e321ed6"
FlickRaw.shared_secret="99bb0541ec349ae5"

# token 72157633501230371-9da780bd34f67769 and secret f448a228f71afecd
flickr.access_token = "72157633501230371-9da780bd34f67769"
flickr.access_secret = "f448a228f71afecd"

# From here you are logged:
login = flickr.test.login
puts "You are now authenticated as #{login.username}"

puts 'photo path:'
photo_path = gets.strip # 命令行输入图片路径

puts 'photo tilte:'
photo_title = gets.strip 
if photo_title.empty?
  photo_title = File.basename(photo_path, ".*") # 若没有输入title，默认用图片名
end

puts 'photo description:'
photo_description = gets.strip

# 所有图片都存在这个set中
SET_TITLE="markdown_imgs"
SET_DESCRIPTION="iFlikcr应用，tiemei支持，详见defworld.com"

photo_id = flickr.upload_photo photo_path, :title => photo_title, 
                              :description => photo_description

set = nil

has_set = false
# !!! 换成你自己的user_id，右侧可拿到：http://www.flickr.com/services/api/explore/flickr.auth.oauth.getAccessToken
flickr.photosets.getList(:user_id => '79104125@N05').each do |e|
  if e.to_hash['title'] == SET_TITLE
    has_set = true
    set = e.to_hash
  end
end
# title相同的set还不存在
if not has_set
  set = flickr.photosets.create(:title       => SET_TITLE, 
                                :description => SET_DESCRIPTION,
                                :primary_photo_id    => photo_id)
else
  flickr.photosets.addPhoto(:photoset_id => set['id'], 
                            :photo_id    => photo_id)
end

# 获取图片外链
info = flickr.photos.getInfo(:photo_id => photo_id)
puts FlickRaw.url(info)
