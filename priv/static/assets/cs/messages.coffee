app = angular.module "ChatterMessages", ["PhoenixSocket"]

app.controller "MessagesController", ['socket', '$scope', '$cookies', (socket, $scope, $cookies)->
  $scope.messages = []
  $scope.users = []
  $scope.newMessage = {}

  topic = "Lobby"

  socket.join "broadcast:#{topic}", {sender_name: $cookies.sender_name}, (channel)->
    channel.on 'join', (response)->
      $scope.topic = topic
      $scope.messages = response.messages
      $scope.users = response.active_users

    channel.on 'receive', (message)->
      $scope.messages.push message

    channel.on 'user:joined', (message)->
      _.pull($scope.users, message.sender_name).push(message.sender_name)

    channel.on 'user:left', (message)->
      _.pull($scope.users, message.sender_name)

    $scope.sendMessage = (message)->
      channel.send('send', $scope.newMessage);
      $scope.newMessage = {}
]

app.directive "message", ->
	{
    templateUrl: 'partials/message.html'
    restrict: 'E'
  }
