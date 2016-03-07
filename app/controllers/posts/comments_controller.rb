module Posts
  class CommentsController < ApplicationController
    before_filter :load_defaults

    def load_defaults
      @post = Post.find(params[:post_id]) 
    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.post = @post

      if @comment.save
        redirect_to post_path(@post)
      else
        render "new"
      end
    end

    def comment_params
      params.require(:comment).permit!
    end

  end
end