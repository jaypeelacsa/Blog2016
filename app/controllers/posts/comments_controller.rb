module Posts
	class CommentsController < ApplicationController
		before_filter :load_defaults

		def load_defaults
			@post = Post.find(params[:post_id])
		end

		def new
			@comment = Comment.new
			post = Post.find(params[:post_id])
	    @comment = post.comments.build
	    @posts = Post.all
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

		def show
			@comment = Comment.find(params[:id])
#			@comments = Comment.where(post_id: @post.id)
			@posts = Post.all
		end

		def edit
			@comment = Comment.find(params[:id])
			@posts = Post.all
			end

		def update
			@comment = Comment.find(params[:id])
			if @comment.update_attributes(comment_params)
				redirect_to post_path(@post)
			else
				render "edit"
			end
		end

		def destroy
			@comment = Comment.find(params[:id])
			post = Post.find(params[:post_id])
			@comment.destroy
			redirect_to post_path(@post)
		end
		
		def comment_params
				params.require(:comment).permit!
		end
	end
end