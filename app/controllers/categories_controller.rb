class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		@posts = Post.all
 	end

 	def new
 		@category = Category.new
 		@posts = Post.all
 	end

 	def create
 		@category = Category.new(category_params)
 		if @category.save
 			redirect_to categories_path
 		else
 			render "new"
 		end
 	end

 	def show
 		@category = Category.find(params[:id])
 		@posts = Post.where(category_id: @category.id)
 		@posts = Post.all
 	end

 	def edit
 		@category = Category.find(params[:id])
 		@posts = Post.all
 	end

 	def update
 		@category = Category.find(params[:id])

 		if @category.update_attributes(category_params)
 			redirect_to categories_path
 		else
 			render "edit"
 		end
 	end

 	def destroy
 		@category = Category.find(params[:id])
 		@category.destroy
 		redirect_to categories_path
 	end

 	def category_params
 		params.require(:category).permit!
 	end
end