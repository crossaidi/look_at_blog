class Api::PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :process_image, only: [:update, :create]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: { status: 422 }
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { status: 422 }
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    render json: @post
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :body, :excerpt, :image)
    end

    def process_image
      if params[:post][:image]
        params[:post][:image] = PostsHelper.decode_image(params[:post][:image])
      end
    end
end
