class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def create
  end

  def new
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
