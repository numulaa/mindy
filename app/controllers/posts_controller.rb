class PostsController < ApplicationController
  # displating all the posts
  def index
    @posts = Post.all
  end

  # displaying 1 post based on the index as params
  def show
    @post = Post.find(params[:id])
  end

  # displaying the create new post page
  def new
    @post = Post.new
  end

  # creating a new post
  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  # displaying the edit page
  def edit
    @post = Post.find(params[:id])
  end

  # updating the existing post
  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # deleting the post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end
  # to protect
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
