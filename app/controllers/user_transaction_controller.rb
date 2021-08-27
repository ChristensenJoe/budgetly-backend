require 'date'
require 'pry'

class UserTransactionController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here

  get "/transactions/main_category/:id" do 
    transaction = UserTransaction.find(params[:id]);
    transaction.main_category.to_json()
  end

  get "/transactions" do
    if params[:user_id] && params[:limit]
      user = User.find(params[:user_id])
      
      user.transactions.order(created_at: :desc).limit(params[:limit]).uniq().to_json()
    elsif params[:user_id]
      user = User.find(params[:user_id])
      user.transactions.uniq().reverse().to_json()
    elsif params[:category_id]
      category = Category.find(params[:category_id])
      category.transactions.reverse().to_json()
    else
      UserTransaction.all.to_json()
    end
  end

  get "/transactions/:id" do
    UserTransaction.find(params[:id]).to_json()
  end

  delete "/transactions/:id" do
    transaction = UserTransaction.find(params[:id])
    user = transaction.user
    main_category = transaction.category_transactions.find_by(primary_category: 1).category
    
    transaction.category_transactions.destroy_all

    new_category_balance = 0
    new_user_balance = 0
    if transaction.gain
      new_category_balance = main_category.balance.to_i - transaction.amount
      new_user_balance = user.balance.to_i - transaction.amount
    else
      new_category_balance = main_category.balance.to_i + transaction.amount
      new_user_balance = user.balance.to_i + transaction.amount
    end

    main_category.update(balance: new_category_balance)

    user.update(balance: new_user_balance)

    transaction.destroy

    transaction.to_json()
  end

  post "/transactions" do
    new_transaction = UserTransaction.create(user_id: params[:user_id], name: params[:name], amount: params[:amount], gain: params[:gain], created_at: Date.today.to_s)

    params[:category_ids].each do |category_id|
      CategoryTransaction.create(category_id: category_id, user_transaction_id: new_transaction.id, primary_category: false)
    end

    main_category = Category.find(params[:main_category_id])
    user = User.find(params[:user_id])

    if new_transaction.gain
      new_balance = main_category.balance + params[:amount]
      new_user_balance = user.balance + params[:amount]
    else
      new_balance = main_category.balance - params[:amount]
      new_user_balance = user.balance - params[:amount]
    end

    main_category.update(balance: new_balance)
    user.update(balance: new_user_balance)

    CategoryTransaction.create(category_id: main_category.id, user_transaction_id: new_transaction.id, primary_category: true)

    new_transaction.to_json()


  end
end
