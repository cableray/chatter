class Socket extends Phoenix.Socket
  constructor: (args..., $rootScope)->
    @$rootScope = $rootScope
    super(args...)

  join: ->
    chan = new Channel(arguments..., this, @$rootScope)
    @channels.push chan
    @rejoin chan if @isConnected

class Channel extends Phoenix.Channel
  constructor: (args..., $rootScope)->
    @$rootScope = $rootScope
    super(args...)

  refreshDom: ->
    @$rootScope.$applyAsync()
  
  on: (event, callback)->
    super event, => 
      callback(arguments...)
      @refreshDom()


app = angular.module "PhoenixSocket", []

app.factory "socket", ['$rootScope', ($rootScope)->
  new Socket('/sockets', $rootScope)
]
