class AddColumnInComment < ActiveRecord::Migration
  def change
  	add_column(:comments, :user_id, :integer)
  	add_column(:comments, :user_comment, :text)
  end
end
