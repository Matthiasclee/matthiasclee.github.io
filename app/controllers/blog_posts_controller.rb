class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[ show edit update destroy ]

  # GET /blog_posts or /blog_posts.json
  def index
    @blog_posts = BlogPost.all
  end

  # GET /blog_posts/1 or /blog_posts/1.json
  def show
  end

  def embed
    response.headers.delete "X-Frame-Options"
    @blog_post = BlogPost.find(params[:id])
    render partial: 'blog_posts/embed', layout: false
  end

  # GET /blog_posts/new
  def new
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')

    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
  end

  # POST /blog_posts or /blog_posts.json
  def create
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')

    @blog_post = BlogPost.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blog_post_url(@blog_post), notice: "Blog post was successfully created." }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1 or /blog_posts/1.json
  def update
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')

    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to blog_post_url(@blog_post), notice: "Blog post was successfully updated." }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1 or /blog_posts/1.json
  def destroy
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')

    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: "Blog post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :content)
    end
end
