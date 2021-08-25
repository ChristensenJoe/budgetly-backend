class UserController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    # Add your routes here
    get "/users" do
      User.all.to_json()
    end
  
    get "/users/:id" do
      User.find(params[:id]).to_json()
    end
  
    post "/users" do
      newUser = User.create(username: params[:username], hashed_password: params[hashed_password])
      newUser.to_json
    end
  
    patch "/users/:id" do
      user = User.find(params[:id])
      user.update(pay_dates: params[:pay_dates], balance: params[:balance], paycheck: [:paycheck])
      user.to_json
    end
end