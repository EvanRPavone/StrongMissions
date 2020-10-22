class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]
  
    # GET /trips
    # GET /trips.json
    def index
      @posts = Post.all
    end
  
    # GET /trips/1
    # GET /trips/1.json
    def show
    end
  
    # GET /trips/new
    def new
      @post = current_user.posts.build
    end
  
    # GET /trips/1/edit
    def edit
    end
  
    # POST /trips
    # POST /trips.json
    def create
      # @trip = Trip.new(trip_params)
      @post = current_user.posts.build(post_params)
  
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /trips/1
    # PATCH/PUT /trips/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /trips/1
    # DELETE /trips/1.json
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully removed.' }
        format.json { head :no_content }
      end
    end
  
    def correct_user
      @post = current_user.Posts.find_by(id: params[:id])
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