class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
 # before_action :authenticate_user!
  # skip_before_filter :authenticate_user!, :only => [:index, :show, :latest_blogs, :display_category, :display_tags]
  respond_to :html

  def index
    flash[:clear]
    @blogs = Blog.order('created_at DESC',).paginate(:page=>params[:page],:per_page=>5)
    display_all_tags
    respond_with(@blogs)
  end

  def show
    flash[:clear]
    @blogs = Blog.all
    display_all_tags
    respond_with(@blog)
  end

  def new
    
    @blog = Blog.new
    respond_with(@blog)
 
  end

  def edit

  end

  def create
    @blog = Blog.new(blog_params)
    @newsletter = NewsLetter.all
       if @blog.save
    @newsletter.each do |i|
      if i.subscribed?
        @nid = i.id
        @uri = request.original_url
        @email = i.email
        BlogsMailer.blog_update(@blog,@email,@uri,@nid).deliver
      end
    end
  end
    respond_with(@blog)
  end

  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end


 def search_sphinx
     tokens = []
    blogs1 =Blog.where("category LIKE ?", "%#{params[:q]}%")
       
    blogs1.each do |blog|
      tokens << "{ \"id\":\"#{blog.category}\",\"category\":\"#{blog.category}\"}"
    end
    puts tokens
    render :text => "[#{tokens.join(",")}]"
  end

  def search
    @blogs1 = Blog.where("blogs.category LIKE ?", "%#{params[:category]}%")
    render :action => 'index'
  end

  def latest_blogs
    @blogs = Blog.last(2).reverse
    render :layout => false
  end

  def display_category
    @categories = Blog.where("blogs.category LIKE ?", "%#{params[:category]}%").order('created_at DESC',).paginate(:page=>params[:page],:per_page=>5)
    display_all_tags
  end


  def display_tags
    @tags = Blog.where("blogs.tags LIKE ?", "%#{params[:tags]}%").order('created_at DESC',).paginate(:page=>params[:page],:per_page=>5)
    display_all_tags
  end

  def display_all_tags
    @display_all = Blog.all
    @tag = []
    @category = []
    @display_all.each do |blog|
      @tags_all = blog.tags.split(',')
      @Categories_all = blog.category.split(',')
      @tags_all.each do |ta|
        @tag << ta
      end
      @Categories_all.each do |cat|
        @category << cat
      end
    end
  end

def original_url
  base_url + original_fullpath
end

  private
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:name, :details, :category, :tags, :post_date, :blog_video, :avatar, :user_id,:slug , :author, :link, :team_id)
    end
end
