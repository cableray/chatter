app = window.angular.module 'Chatter', ['ChatterMessages', 'ngCookies']

app.run ['$rootScope', '$cookies', ($rootScope, $cookies)->
  $rootScope.$cookies = $cookies
  $cookies.sender_name ||= '(anonymous)'
]