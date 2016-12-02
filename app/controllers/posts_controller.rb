class PostsController < ApplicationController

  def index
    @posts = Post.all
    render component: 'Posts', props:{ posts: @posts }
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_post)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def params_post
    params.require(:post).permit(:content, :author)
  end
end
