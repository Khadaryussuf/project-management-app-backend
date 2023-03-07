class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
   # Routes for the member
   get '/members' do 
    members = Member.all.order(created_at: :asc)
    members.to_json
  end

  post '/members' do
    member = Member.create(
      name: params[:name],
      email: params[:email],
      user_id: params[:user.id],
      project_id: params[:project.id]
    )
    member.to_json
  end
  
  patch '/members/:id' do
    member = Member.find(params[:id])
    member.update(
      name: params[:name],
      email: params[:email],
      user_id: params[:user.id],
      project_id: params[:project.id]
    )
    member.to_json
  end

  delete '/members/:id' do
    member = Member.find(params[:id])
    member.destroy
    member.to_json
  end

  get '/projects' do 
    projects = Project.all.order(created_at: :asc)
    projects.to_json
  end
  post '/projects' do
    project = Project.create(
      name: params[:name],
      description: params[:description],
      status: params[:status],
      date: params[:date],
      author: params[:author]
    )
    project.to_json
  end
  patch '/projects/:id' do
    project = Project.find(params[:id])
    project.update(
      name: params[:name],
      description: params[:description],
      status: params[:status],
      date: params[:date],
      author: params[:author]
    )
    project.to_json
  end

  delete '/projects/:id' do
    project = Project.find(params[:id])
    project.destroy
    project.to_json
  end
  

post '/users/login' do
  begin
    data = JSON.parse(request.body.read)
    username = data['username']
    password = data['password']

    user = User.find { |u| u[:username] == username }

    if user && BCrypt::Password.new(user[:password_digest]) == password
      content_type :json
      { id: user[:id], username: user[:username] }.to_json
    else
      halt 401, 'Unauthorized'
    end
  rescue JSON::ParserError
    halt 400, 'Bad request'
  rescue StandardError => e
    halt 500, "Internal server error: #{e.message}"
  end
end


get '/users' do 
  users = User.all.order(created_at: :asc)
  users.to_json
end
post '/users' do
  user = User.create(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )
  user.to_json
end
patch '/users/:id' do
  user = User.find(params[:id])
  user.update(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )
  user.to_json
end

delete '/users/:id' do
  user = User.find(params[:id])
  user.destroy
  user.to_json
end
end



  