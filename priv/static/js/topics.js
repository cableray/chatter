// Generated by CoffeeScript 1.7.1
(function() {
  var app;

  app = angular.module("ChatterTopics", []);

  app.controller("TopicsController", [
    '$scope', 'socket', '$cookies', function($scope, socket) {
      this.changeTopic = function(topic) {
        return socket.join('broadcast', topic, {
          sender_name: $cookies.sender_name
        }, function(channel) {
          return this.channel = channel;
        });
      };
      return true;
    }
  ]);

}).call(this);

//# sourceMappingURL=topics.map
