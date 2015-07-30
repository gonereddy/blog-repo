json.array!(@blogs) do |blog|
  json.extract! blog, :id, :name, :details, :category, :tags, :post_date, :blog_video, :avatar, :user_id
  json.url blog_url(blog, format: :json)
end
