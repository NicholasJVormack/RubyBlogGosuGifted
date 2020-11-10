class PostsController < ApplicationController


    def index 
        @posts =Post.all.order("created_at DESC")
    end
    
    def new
        #Calls a New Post.
        @post = Post.new
    end

    def create 

        @post = Post.new(post_params)

        #check if the post saves 
        if @post.save
            redirect_to @post
        else
            render 'new'
    end

end

def show 
    @post = Post.find(params[:id])
end

def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
        redirect_to @post
    else
        render 'edit'
end 

end

def edit
    @post = Post.find(params[:id])
end

def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
end

    private


    def post_params
        params.require(:post).permit(:title, :content)
    end

end
