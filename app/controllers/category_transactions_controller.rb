class CategoryTransactionsController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    # Add your routes here
    get "/category_transactions" do
        CategoryTransaction.all.to_json()
      end
    
      get "/category_transactions/:id" do
        CategoryTransaction.find(params[:id]).to_json()
      end
end