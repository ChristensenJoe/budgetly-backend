require 'date'

class UserTransactionController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/transactions" do
    if params[:user_id] && params[:limit]
      user = User.find(params[:user_id])
      
      user.transactions.order(created_at: :desc).limit(params[:limit]).uniq().to_json()
    elsif params[:user_id]
      user = User.find(params[:user_id])
      user.transactions.uniq().to_json()
    elsif params[:category_id]
      category = Category.find(params[:category_id])
      category.transactions.to_json()
    else
      UserTransaction.all.to_json()
    end
  end

  get "/transactions/:id" do
    UserTransaction.find(params[:id]).to_json()
  end

  post "/transactions" do
    new_transaction = UserTransaction.create(user_id: params[:user_id], name: params[:name], amount: params[:amount], created_at: Date.today.to_s)

    params[:category_ids].each do |category_id|
      CategoryTransaction.create(category_id: category_id, user_transaction_id: new_transaction.id, primary_category: false)
    end

    main_category = Category.find(params[:main_category_id])
    new_balance = main_category.balance - params[:amount]
    main_category.update(balance: new_balance)

    user = User.find(params[:user_id])
    new_user_balance = user.balance - params[:amount]
    user.update(balance: new_user_balance)

    CategoryTransaction.create(category_id: main_category.id, user_transaction_id: new_transaction.id, primary_category: true)

    new_transaction.to_json()
  end
end
