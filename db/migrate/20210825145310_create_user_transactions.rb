class CreateUserTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_transactions do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.decimal :amount
      t.boolean :gain
      t.date :created_at
    end
  end
end
