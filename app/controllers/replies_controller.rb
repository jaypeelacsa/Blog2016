class RepliesController < ApplicationController

	def index
			@replies = Reply.all
		comment = Comment.find(params[:comment_id])
		@replies = comment.replies
	end

	def new
		@reply = Reply.new
		comment = Comment.find(params[:comment_id])
	    @reply = comment.replies.build
	end

	def create
			@reply = Reply.new(reply_params)
			comment = Comment.find(params[:comment_id])
		    @reply = comment.replies.create(params[:reply])

		    respond_to do |format|
	      if @reply.save
	      	format.html { redirect_to([@reply.comment, @reply], :notice => 'Comment was successfully created.') }
        	format.xml  { render :xml => @reply, :status => :created, :location => [@reply.comment, @reply] }

		  else
			render "new"
	 	      end
	 	  end
	end

	def show
		@reply = Reply.find(params[:id])
		comment = Comment.find(params[:comment_id])
	    @reply = comment.replies.find(params[:id])

	end

	def edit
		@reply= Reply.find(params[:id])
	end

	def update
		@reply= Reply.find(params[:id])

			if @reply.update_attributes(reply_params)
				redirect_to comment_reply_path(@reply.comment, @reply)
			else
				render "edit"
			end
	end

	def destroy
		@reply = Reply.find(params[:id])
		comment = Comment.find(params[:comment_id])
	    @reply = comment.replies.find(params[:id])
	    @reply.destroy

	    respond_to do |format|
	      format.html { redirect_to(comment_replies_url) }
	      format.xml  { head :ok }
	    end
	end

	def reply_params
		params.require(:reply).permit!
	end

end