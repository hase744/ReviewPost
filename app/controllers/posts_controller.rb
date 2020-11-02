class PostsController < ApplicationController
  def index
  end

  def create
    @id = params[:id].to_i
    @product = Product.find_by(id:params[:id])
    if session[:user_id]
      @user = User.find_by(id:session[:user_id])
      @post = Post.new(content: params[:content],product:@product.name, user:@user.name)
    else
      @post = Post.new(content: params[:content],product:@product.name)
    end
    @post.save
    redirect_to("/product/#{@id}")
  end

  def edit
    @id = params[:id]
  end

  def destroy
    @product_id = params[:product_id]
    @post_id = params[:post_id]
    @post = Post.find_by(id:@post_id )
    @post.destroy
    @product = Product.find_by(name:@post.product)
    redirect_to("/product/#{@product_id}")
  end


end
