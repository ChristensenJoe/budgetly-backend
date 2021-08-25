class User < ActiveRecord::Base
    has_many :categories
    has_many :category_transactions, through: :categories
    has_many :transactions, through: :category_transactions, source: :user_transaction
end