class BlogsController < ApplicationController
# traitement commun. get_log est appelé dans les fonction entre crochet avant toute action
  before_action :get_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(created_at: :asc)
    # raise
    # binding.pry
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render "new"
    else
      if @blog.save
        redirect_to blogs_path, notice: "Blog créé !!!"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @blog.delete
    redirect_to blogs_path, notice: "Blog supprimé"
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Blog mis à jour"
    else
      render "edit"
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render "new" if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end
end
