xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @user.user_name+ " blog feed"
    xml.description "This is rss feed for "+  @user.user_name
    xml.link root_url(:subdomain => @user.subdomain)

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description truncate(post.body , length:300)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link root_url+post_path(post)
        xml.guid root_url+post_path(post)
      end
    end
  end
end