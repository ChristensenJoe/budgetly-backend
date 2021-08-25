class CategoryController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    # Add your routes here
    get "/categories" do
        Category.all.to_json()
      end
    
      get "/categories/:id" do
        Category.find(params[:id]).to_json()
      end
end