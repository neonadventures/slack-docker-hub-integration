require 'bundler/setup'

require 'sinatra/base'
require 'rest-client'
require 'json'

class SlackDockerApp < Sinatra::Base
  post "/*" do
    docker = JSON.parse(request.body.read)
    slack = {text: "Successfully built a new image for <#{docker['repository']['repo_url']}|#{docker['repository']['repo_name']}>"}
    RestClient.post "https://hooks.slack.com/#{params[:splat]}", payload: slack.to_json
  end
end

run SlackDockerApp