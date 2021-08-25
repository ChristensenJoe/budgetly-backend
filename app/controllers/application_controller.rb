require_relative './user_controller'
require_relative './category_controller'
require_relative './user_transaction_controller'
require_relative './category_transactions_controller'


class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  use UserController
  use CategoryController
  use UserTransactionController
  use CategoryTransactionsController
  # Add your routes here

  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
end
