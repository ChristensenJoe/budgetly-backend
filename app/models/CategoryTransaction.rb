class CategoryTransaction < ActiveRecord::Base
    belongs_to :category
    belongs_to :user_transaction
end