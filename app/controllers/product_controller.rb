class ProductController < ApplicationController
  def index
    @img="/sample"+".png"
    @image = "/sample"+".png"
    @products = Product.all
  end

  def show
    @product = Product.find_by(id:params[:id])
    @id = params[:id].to_i
    @postswhere = Post.where(product:@product.name)
    @posts = @postswhere.all.order(id: "DESC")
  end



  def add
    #rails g model Product name:string item:string manufacturer:string price:string height:string width:string depth:string function:text
    #rails g model Product name:String item:String manufacturer:String price:String height:String width:String depth:String function:text
    #product = Product.new(name: "sample",item: "rice-cooker", manufacturer: "panasonic", price: 30000, height: 300, width: 300, depth: 300, function:300)
    @products = Product.all
  end

  def edit
    @product = Product.find_by(id:params[:id])
  end

  def create
    @product = Product.new(name: params[:name],item: params[:item],manufacturer: params[:manufacturer],price: params[:price],height: params[:height],width: params[:width],depth: params[:depth],function: params[:function])
    @product.save
  end

  def amend
      @product = Product.find_by(id:params[:id])
      @product.name = params[:name]
      @product.manufacturer = params[:manufacturer]
      @product.item = params[:item]
      @product.price = params[:price]
      @product.height = params[:height]
      @product.width = params[:width]
      @product.depth = params[:depth]
      @product.function = params[:function]

      @product.image_name = "#{@product.id}.jpg"
      image = params[:image]
      File.binwrite("public/product_images/#{@product.image_name}",image.read)
      @product.save
      redirect_to("/product/#{@product.id}/edit")

  end
end
