class NewsLetterMailer < ActionMailer::Base

  def registration_confirmation(newsletter)
    @newsletter = newsletter
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
     @url = "http://localhost:3000/"
    mail(:from => "noreply@student.com", :to => @newsletter.email, :subject => "Welcome to our Blog")
  end
end
