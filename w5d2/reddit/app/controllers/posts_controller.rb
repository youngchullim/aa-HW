class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])    
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    
    if @post
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:error] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
