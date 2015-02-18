get '/' do
  redirect '/events'
end

get '/events' do
  @events = Event.all
  erb :"events/index"
end

get '/events/new' do
  login_required
  @event = Event.new
  erb :"events/new"
end

post '/events' do
  login_required
  @event = Event.new(params[:event])
  @event.host = current_user
  redirect '/events' if @event.save
  erb :"events/new"
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :"events/show"
end

get '/events/:id/edit' do
  login_required
  @event = Event.find(params[:id])
  erb :"events/edit"
end

put '/events/:id' do
  login_required
  @event = Event.find(params[:id])
  redirect "/events/#{@event.id}" if @event.update(params[:event])
  erb :"events/edit"
end

delete '/events/:id' do
  login_required
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/events"
end
