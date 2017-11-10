require "base64"

class PostController < ApplicationController
  def index
    puts "\n\n context=[#{context.request.headers.inspect}] \n\n"
    str1 = context.request.headers["Authorization"]
    puts "\n\n str1=[#{str1}] \n\n"
    enc = Base64.decode_string(str1.lchop("Basic "))
    puts "\n\n enc=[#{enc}] \n\n"
    posts = Post.all
    render("index.slang")
  end

  def show
    if post = Post.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def new
    post = Post.new
    render("new.slang")
  end

  def create
    rp = params.raw_params.to_h
    puts "\n\n post_params1=[#{rp.inspect}] \n\n"
    b = 1.to_f64()
    puts "\n\n b=[#{b}] \n\n"
    # p1 = raw_params["draft"]
    # puts "\n\n post_params2=[#{p1.inspect}] \n\n"

    params.raw_params["draft"] = "1" if rp["draft"].includes?("1")

    raw_params2 = params.raw_params.to_h
    puts "\n\n post_params2=[#{raw_params2.inspect}] \n\n"
    # params[:draft] = "1" if params[:draft].includes?("1")
    # puts "\n\n post_params2=[#{params.to_json}] \n\n"
    # json = ""
    # params.each do | k, v |
    #   # json += "\"#{k}\": #{v}" if (attr.types == String)
    #   json += "\"#{k}\": #{v}\n"
    # end
    # puts "\n\n json=[#{params.inspect}] \n\n"
    post = Post.new(post_params.validate!)

    if post.valid? && post.save
      flash["success"] = "Created Post successfully."
      redirect_to "/posts"
    else
      flash["danger"] = "Could not create Post!"
      render("new.slang")
    end
  end

  def edit
    if post = Post.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def update
    if post = Post.find(params["id"])
      post.set_attributes(post_params.validate!)
      if post.valid? && post.save
        flash["success"] = "Updated Post successfully."
        redirect_to "/posts"
      else
        flash["danger"] = "Could not update Post!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def destroy
    if post = Post.find params["id"]
      post.destroy
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
    end
    redirect_to "/posts"
  end

  def post_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:body) { |f| !f.nil? }
      required(:draft){ |f| !f.nil? }
    end
  end
end
