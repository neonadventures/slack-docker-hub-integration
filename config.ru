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
    slack = {text: "[<#{docker['repository']['repo_url']}|#{docker['repository']['repo_name']}#{docker['push_data']['images']}>] new image build complete."}
    RestClient.post("https://hooks.slack.com/#{params[:splat].first}", payload: slack.to_json){ |response, request, result, &block|
        RestClient.post(docker['callback_url'], {state: response.code==200?"success":"error"}.to_json, :content_type => :json)
    }
  end
end

run SlackDockerApp
