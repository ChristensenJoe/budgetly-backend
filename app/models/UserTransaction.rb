class UserTransaction < ActiveRecord::Base
    has_many :category_transactions
    has_many :categories, through: :category_transactions
    belongs_to :user
end