class CommentsController < ApplicationController

	def index
		@comments = Comment.all
		post = Post.find(params[:post_id])
		@comments = post.comments
	end

	def new
		@comment = Comment.new
		post = Post.find(params[:post_id])
	    @comment = post.comments.build
	end

	def create
		@comment = Comment.new(comment_params)
		post = Post.find(params[:post_id])
	    @comment = post.comments.create(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
	end

	def show

	   @comment = Comment.find(params[:id])
		post = Post.find(params[:post_id])
	    @comment = post.comments.find(params[:id])
	    @replies = Reply.where(comment_id: @comment.id)
 
	end

	def edit
	      #post = Post.find(params[:post_id])
    	  #@comment = post.comments.find(params[:id])
  			@comment= Comment.find(params[:id])
	end

	def update

			@comment = Comment.find(params[:id])

			if @comment.update_attributes(comment_params)
				redirect_to post_path(@comment.post_id)
			else
				render "edit"
			end
		   # post = Post.find(params[:post_id])
		   # @comment = post.comments.find(params[:id])


		   # respond_to do |format|
		    #  if @comment.update_attributes(params[:comment])
		     #   format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
		      #  format.xml  { head :ok }
		      #else
		      ##  format.html { render :action => "edit" }
		       # format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
		      #end
		   # end
	end

	def destroy

		@comment = Comment.find(params[:id])
		post = Post.find(params[:post_id])
	    @comment = post.comments.find(params[:id])
	    @comment.destroy

	    respond_to do |format|
	      format.html { redirect_to(post_comments_url) }
	      format.xml  { head :ok }
	    end
	end

	def comment_params
		params.require(:comment).permit!
	end

end