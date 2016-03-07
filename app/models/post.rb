class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :date_posted, presence: true
	validates :content, presence: true
<<<<<<< HEAD

	belongs_to :user
	belongs_to :category
	has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true

=======
	belongs_to :user
	belongs_to :category
	has_many :comments
>>>>>>> afbc708057b584af9152f5855d498205da64b253
end
