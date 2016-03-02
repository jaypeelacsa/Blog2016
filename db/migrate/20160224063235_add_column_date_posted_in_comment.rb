class AddColumnDatePostedInComment < ActiveRecord::Migration
  def change
  	add_column(:comments, :date_posted, :date)
  end
end
