require 'bundler/setup'

require 'sinatra/base'
require 'rest-client'
require 'json'

class SlackDockerApp < Sinatra::Base
  get "/*" do
    params[:splat].first
  end
  post "/*" do
    docker = JSON.parse(request.body.read)
    slack = {text: "[<#{docker['repository']['repo_url']}|#{docker['repository']['repo_name']}>] new image build complete."}
    RestClient.post "https://hooks.slack.com/#{params[:splat].first}", payload: slack.to_json
  end
end

run SlackDockerApp