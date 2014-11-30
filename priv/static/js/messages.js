function renderMessage(message){
    var $messages = $("#message-panel");

      $('<div class="message">'+
        '<time class="sent-at pull-right text-muted">'+message.sent_at.year+'-'+message.sent_at.month+'-'+message.sent_at.day +'</time>'+
        '<span class="sender-name text-muted">'+message.sender_name+' </span>'
        +message.body+
        '</div>').
      hide().
      appendTo($messages).
      fadeIn();
  }


function joinTopic(socket, topic){
  socket.join('broadcast', topic, {sender_name: '~anon'}, function(channel){
    channel.on('join', function(response){
      $("#message-panel").empty();
      _.each(response.messages, renderMessage);
    });
    channel.on('receive', renderMessage);

    $("#send-message").off().submit(function(event){
      var $message = $("#message");

      channel.send('send', {body: $message.val()});

      $message.val('');
    });
  });
}