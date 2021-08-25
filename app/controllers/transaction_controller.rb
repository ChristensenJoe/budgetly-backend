class TransactionController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    # Add your routes here
    get "/transactions" do
        Transaction.all.to_json()
      end
    
      get "/transactions/:id" do
        Transaction.find(params[:id]).to_json()
      end
end