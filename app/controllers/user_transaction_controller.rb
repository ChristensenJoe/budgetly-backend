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
end
