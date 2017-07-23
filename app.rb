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

post '/store/:id/shoes' do
  brand = Brand.find(params.fetch('brand').to_i)
  store_id = params.fetch('id').to_i
  store = Store.find(store_id)
  @shoe = Shoe.new(label: params.fetch('label'), size: params.fetch('size'), color: params.fetch('color'), brand_id: brand.id, store_id: store.id)
  if @shoe.save
    redirect '/'
  else
    redirect '/error'
  end
end

patch '/store/:id' do
  @store = Store.find(params.fetch('id').to_i)
  @store.update(name: params.fetch('name'))
  @brands = Brand.all
  erb(:store)
end

delete '/store/:id' do
  @store = Store.find(params.fetch('id').to_i)
  @store.shoes.each do |shoe|
    shoe.destroy
  end
  @store.destroy
  redirect '/'
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
  @brands = Brand.all
  @store = Store.find(params.fetch('id').to_i)
  erb(:store)
end

get '/brand/:id' do
  @brand = Brand.find(params.fetch('id').to_i)
  erb(:brand)
end

delete '/brand/:id' do
  brand = Brand.find(params.fetch('id').to_i)
  brand.shoes.each do |shoe|
    shoe.destroy
  end
  brand.destroy
  redirect '/'
end

get '/error' do
  erb(:error)
end
