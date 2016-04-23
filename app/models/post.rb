class Post < ActiveRecord::Base
	include Bootsy::Container
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
 	validates :user_id, presence: true
 	validates :title, presence: true
 	validates :content, presence: true
end
