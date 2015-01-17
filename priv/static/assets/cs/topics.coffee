app = angular.module "ChatterTopics", []

app.controller "TopicsController", [
  '$scope', 'socket', '$cookies',
  ($scope, socket)->
    @changeTopic = (topic)->
      socket.join 'broadcast', topic, {sender_name: $cookies.sender_name}, (channel)->
        @channel = channel
    true
]
