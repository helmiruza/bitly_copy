get '/' do
	@urls = Url.all
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  @url = Url.create(params[:url])

  	if @url.valid?	  
		redirect to "/urls/created/#{@url.short_url}"
		erb :index
	else
		redirect to "/error"
	end
end

get '/error' do
	erb :error
end

get '/urls/created/:short_url' do |x|
	@url = Url.find_by(short_url: x)
	# @post = Post.find(i)
	# @cat_name = Category.find(@post.category_id).name
	erb :shorturl
end

# e.g., /q6bda
get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	
  # redirect to appropriate "long" URL
  	if url.nil?
  		redirect to "/error"
  	else
  		url.click_count += 1
  		url.save
  		redirect url.original_url
	end
end
