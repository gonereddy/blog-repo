module BlogsHelper
	def blog_count(category)
		count = Blog.where("blogs.category LIKE ?", "%#{category}%").count
		return count
	end

end
