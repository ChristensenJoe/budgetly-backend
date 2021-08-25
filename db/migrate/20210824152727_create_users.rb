class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :profile_image, default: ""
      t.string :pay_dates, default: ""
      t.decimal :balance, default: 0.0
      t.decimal :paycheck, default: 0.0
    end
  end
end
