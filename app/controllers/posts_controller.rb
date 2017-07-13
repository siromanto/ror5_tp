class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(page_params)
    # @post.user = current_user # додавання id поточного юзера
    if @post.save
      redirect_to @post, success: 'Post successfuly created'
    else
      render :new, danger: 'Post doesn\'t created'
    end
  end

  def edit
  end

  def update
    if @post.update(page_params)
      redirect_to @post, success: 'Post successfuly updated'
    else
      render :edit, danger: 'Something goes wrong'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, success: 'Post successfuly deleted'
    else
      redirect_to posts_path, danger: 'Something goes wrong'
    end
  end



  private

  def page_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
