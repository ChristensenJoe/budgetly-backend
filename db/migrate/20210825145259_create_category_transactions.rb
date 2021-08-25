class CreateCategoryTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :category_transactions do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :user_transaction, foreign_key: true
      t.boolean :primary_category
    end
  end
end
