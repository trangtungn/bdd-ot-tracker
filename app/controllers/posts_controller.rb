# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all.order(:id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: current_user.id, **post_params)

    if @post.save
      redirect_to @post, notice: 'Your post was created successfully!'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @post.update(post_params)

    render :show, notice: 'Your post was updated successfully!'
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted successfully!'
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
