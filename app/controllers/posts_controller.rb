class PostsController < ApplicationController

    def index
        @post = Post.all
    end

    def show
        @posts = Post.where({"place_id" => params["id"] })
    end

    def new
        @post = Post.new
        @post["place_id"] = params["place_id"]
    end
    
    def create
        @post = Post.new
        @post["title"] = params["post"]["title"]
        @post["description"] = params["post"]["description"]
        @post["posted_on"] = params["post"]["posted_on"]
        @post["place_id"] = params["post"]["place_id"]
        @post.save
        redirect_to "/places/#{@post["place_id"]}"
    end
end