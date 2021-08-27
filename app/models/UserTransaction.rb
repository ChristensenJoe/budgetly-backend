class UserTransaction < ActiveRecord::Base
    has_many :category_transactions
    has_many :categories, through: :category_transactions
    belongs_to :user

    def main_category
        main_category = self.category_transactions.find_by(primary_category: 1);

        Category.find(main_category.category_id)
    end
end