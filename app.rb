require "bundler/setup"
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

get '/myshop' do
  erb(:myshop)
end

post '/stores' do
  store = Store.new(name: params.fetch('name'))
  if store.save
    redirect '/'
  else
    redirect '/error'
  end
end

post '/brands' do
  brand = Brand.new(name: params.fetch('name'))
  if brand.save
    redirect '/'
  else
    redirect '/error'
  end
end

get '/store/:id' do
  @store = Store.find(params.fetch('id').to_i)
  erb(:store)
end

get '/brand/:id' do
  @brand = Brand.find(params.fetch('id').to_i)
  erb(:brand)
end

get '/error' do
  erb(:error)
end
