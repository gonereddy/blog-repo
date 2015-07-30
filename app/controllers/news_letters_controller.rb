class NewsLettersController < ApplicationController
  before_action :set_news_letter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user.admin or current_user.super_admin
    @news_letters = NewsLetter.all
    respond_with(@news_letters)
    else
    flash[:notice] = "You dont have permission to Access this page"
    redirect_to blogs_path
  end
  end

  def show
    respond_with(@news_letter)
  end

  def new
    @news_letter = NewsLetter.new
    respond_with(@news_letter)
  end

  def edit
  end

  def create
    @news_letter = NewsLetter.new(news_letter_params)
    # if @news_letter.save
      puts "<<<<<<<<<#{@news_letter.email}>>>>>>>>>>>>>>>>>>>"

    respond_with(@news_letter)
  # end
  end

  def update
    @news_letter.update(news_letter_params)
    respond_with(@news_letter)
  end

  def destroy
    @news_letter.destroy
    respond_with(@news_letter)
  end

  def adding_email
    unless params[:email].blank?
    @news_letter = NewsLetter.new(email: params[:email],subscribed: true)
    if @news_letter.save
      NewsLetterMailer.registration_confirmation(@news_letter).deliver
        flash[:notice] = "Mail Id Is Saved Sucessfully"
       else
     flash[:warn] = "Type an valid Email Address Or It has Already Exists"
   end
   respond_to do |format|
  format.js {render inline: "location.reload();" }
    end
  else 
    flash[:warn] = "Empty Email id"
    end
  end

def unsubscribe
  @n = NewsLetter.find(params[:id])
   @n.update_attributes(:subscribed => false)
end


  private
    def set_news_letter
      @news_letter = NewsLetter.find(params[:id])
    end

    def news_letter_params
      params.require(:news_letter).permit(:email,:subscribed)
    end
end
