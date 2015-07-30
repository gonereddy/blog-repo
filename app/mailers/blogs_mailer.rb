
class BlogsMailer < ActionMailer::Base
 
  def blog_update(blog,email,uri,nid)
    @blog = blog
    @email = email
    @uri = uri
    @nid = nid
     @url = "http://localhost:3000/"
    mail(:from => "noreply@student.com", :to => @email, :subject => "Welcome to the Blog ")
  end
end
