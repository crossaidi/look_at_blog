class PostsController < ApplicationController
  respond_to :json

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all.order(:id)
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
      render "public/422", status: 422
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render "public/422", status: 422
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
      params.require(:post).permit(:name, :body, :excerpt)
    end
end
