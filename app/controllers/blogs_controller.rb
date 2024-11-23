class BlogsController < ApplicationController
  def index
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
    def blog_params
      params.require(:blog).permit(:name, :image)
    end
end
