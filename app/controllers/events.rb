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
  @event.update(params[:event])
  if request.xhr?
    content_type :json
    @event.to_json
  else
    redirect "/events/#{@event.id}" unless @event.any_errors?
    erb :"events/edit"
  end
end

delete '/events/:id' do
  login_required
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/events"
end
