class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.decimal :amount
      t.datetime :created_at
    end
  end
end
