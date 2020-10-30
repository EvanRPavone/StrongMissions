class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :name, presence: true #checks if information has been entered.
    validates :experience, presence: true #checks if information has been entered.
    #scope method shows the posts in descending order based on how many comments the post has. The post with most comments is at the top of the page. Used in the posts controller under the index method.
    scope :most_comments, -> {left_joins(:comments).group('posts.id').order('count(comments.post_id) desc')}
end