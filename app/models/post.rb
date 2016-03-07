class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :date_posted, presence: true
	validates :content, presence: true
	belongs_to :user
	belongs_to :category
	has_many :comments
end
