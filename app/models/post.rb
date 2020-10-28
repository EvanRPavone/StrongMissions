class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :name, presence: true
    validates :experience, presence: true

    scope :most_comments, -> {left_joins(:comments).group('posts.id').order('count(comments.post_id) desc')}
end