class CategoryController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/categories" do
    if params[:user_id] && params[:limit]
      user = User.find(params[:user_id])
      user.categories.order(created_at: :desc).limit(params[:limit]).uniq().to_json()
    elsif params[:user_id] && params[:category_name]
      Category.find_by(user_id: params[:user_id], name: params[:category_name]).to_json()
    elsif params[:user_id]
      user = User.find(params[:user_id])
      user.categories.to_json()
    else
      Category.all.to_json()
    end
  end

  get "/categories/:id" do
    Category.find(params[:id]).to_json()
  end
end
