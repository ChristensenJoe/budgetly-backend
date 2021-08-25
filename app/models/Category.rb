
class Category < ActiveRecord::Base
    belongs_to :user
    has_many :category_transactions
    has_many :transactions, through: :category_transactions, source: :user_transaction
end