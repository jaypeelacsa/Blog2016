module Comments
	class RepliesController < ApplicationController
		before_filter :load_defaults

		def load_defaults
			@post = Post.find(params[:post_id])
			@comment = Comment.find(params[:comment_id])
		end

		def new
			@reply = Reply.new
			post = Post.find(params[:post_id])
			comment = Comment.find(params[:comment_id])
	    @reply = post.comments.replies.build
	    @posts = Post.all
		end

		def create
			@reply = Reply.new(reply_params)
			@reply.comment = @comment

			if @reply.save
				redirect_to post_comment_path(@comment)

			else
				render "new"
			end
		end


		
		def reply_params
				params.require(:comment).permit!
		end
	end
end