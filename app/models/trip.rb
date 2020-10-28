class Trip < ApplicationRecord
    belongs_to :user
    validates :group_name, presence: true
    validates :email, presence: true
    validates :when, presence: true
    validates :jobs, presence: true
    validates :escursions, presence: true
end
