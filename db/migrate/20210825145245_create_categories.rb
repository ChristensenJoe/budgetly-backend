class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.decimal :balance
      t.decimal :percentage
    end
  end
end
