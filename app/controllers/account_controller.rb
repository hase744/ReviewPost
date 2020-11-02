class AccountController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email],password:params[:password],image_name:"user_undefined.png")
    @user.save
    redirect_to("/account/index")
  end

  def individual
    @user = User.find_by(id:params[:id])
    @email = User.find_by(id:params[:id], name:@user)
    @postswhere = Post.where(user:@user.name)
    @posts = @postswhere.all.order(id: "DESC")
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.occupation = params[:occupation]
    @user.age = params[:age]
    @user.gender = params[:gender]
    @user.introduction = params[:introduction]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      @image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",@image.read)
    end
    @user.save
    redirect_to("/account/#{@user.id}/individual")
  end

  def delete
    @user = User.find_by(id:params[:id])
    @user.delete
  end

  def login_form
  end

  def login
   @user = User.find_by(email: params[:email], password: params[:password])
   if @user
     flash[:notice] ="ログインしました"
     redirect_to("/account/#{@user.id}/individual")
     session[:user_id] = @user.id
   else
     @error_message = "メールアドレスまたはパスワードが間違っています"
     @email = params[:email]
     @password = params[:password]
     render("account/login_form")
   end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
