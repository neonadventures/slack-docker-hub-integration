Docker Hub build notifications for Slack
========================================

A tiny Sinatra app that receives webhooks from Docker Hub and re-posts them as Slack formatted hooks.

There is a running version of this code on Heroku that you are welcome to use...

https://slack-docker-hub-integration.herokuapp.com/


## Here's how to get setup...

1. Generate an incoming webhook in the Slack integration settings e.g. `https://hooks.slack.com/services/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`
2. Switch the domain from `hooks.slack.com` to `slack-docker-hub-integration.herokuapp.com`
3. Create a new webhook on Docker Hub with pointing to this url. e.g. `https://slack-docker-hub-integration.herokuapp.com/services/T024XLT1F/B031BS1D0/C4YkI21H6jPQ59PHLQLD3S21`


Alternatively you could host the code yourself.
