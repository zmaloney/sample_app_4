module UsersHelper
  
  #Returns the Gravatar for the given user
  def gravatar_for(user, options = { size:50})
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase) #MD5 hashes are case-sensitive, so downcase the input.
    # Michael Hartl, you -bitch-. It's avatar, not avatars, in the URI. 
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
end
