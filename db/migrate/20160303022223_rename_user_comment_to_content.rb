class RenameUserCommentToContent < ActiveRecord::Migration
  def change
  	rename_column :comments, :user_comment, :content
  end
end
