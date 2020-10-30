class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]
  
    # GET /posts
    # GET /posts.json
    def index
      @posts = Post.most_comments
    end
  
    # GET /posts/1
    # GET /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts
    # POST /posts.json
    def create
      # @trip = Trip.new(trip_params)
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to posts_path, notice: 'Post was successfully created.'
      else
        redirect_to new_post_path, notice: 'Cannot leave information blank.'
      end
    end
  
    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
      if @post.update(post_params)
        redirect_to posts_path, notice: 'Post was successfully updated.'
      else
        redirect_to edit_post_path, notice: 'Cannot Leave information blank.'
      end
    end
  
    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @post.destroy
      redirect_to posts_path, notice: 'Post was successfully removed.'
    end
  
    def correct_user #finds the post_id that is associated to the current_user id. if the user does not own that post then it will redirect them to the posts index page with a notice.
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: 'not authorized to edit this post' if @post.nil?
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:name, :experience, :user_id)
      end
  end