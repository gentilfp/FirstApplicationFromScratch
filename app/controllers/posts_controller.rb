class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    
    if @post.save
      flash[:notice] = "Post created"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated"
      redirect_to posts_path
    else
      flash[:notice] = "Ops, an error occurred"
      redirect_to posts_path
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "Post deleted"
      redirect_to posts_path
    else
      flash[:notice] = "Ops, an error occurred"
      redirect_to posts_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end
