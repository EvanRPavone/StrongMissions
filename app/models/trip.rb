class Trip < ApplicationRecord
    belongs_to :user
    validates :group_name, presence: true #checks if information has been entered.
    validates :email, presence: true #checks if information has been entered.
    validates :when, presence: true #checks if information has been entered.
    validates :jobs, presence: true #checks if information has been entered.
    validates :escursions, presence: true #checks if information has been entered.

    scope :search, -> (group_name){ where("group_name LIKE ?", "%#{group_name}%")}
end

def name(my_name)
    puts my_name
end
