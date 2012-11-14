require 'sinatra'
require 'sinatra/activerecord'

#models
require './models/book'

set :database, "sqlite3:///bible.db"

get '/' do
  Book.all.to_json
end
