var ReactChat = React.createClass({
  getInitialState: function () {
    return {
      messages: []
    };
  },

  tick: function() {
    var that = this;
    var url = "/messages/?chatable_id=" + this.props.chatId + "&chatable_type=" + this.props.chatType;
    var chatWindow = document.getElementById("chat-window");
    var isScrolledToBottom = chatWindow.scrollHeight - chatWindow.clientHeight <= chatWindow.scrollTop + 5;
    $.getJSON(url, function(response){
      that.setState({
        messages: response
      })
      if(isScrolledToBottom)
        chatWindow.scrollTop = chatWindow.scrollHeight - chatWindow.clientHeight;
    });
  },

  componentDidMount: function() {
    this.interval = setInterval(this.tick, 1000);
  },

  componentWillUnmount: function() {
    clearInterval(this.interval);
  },

  render: function() {
    return (
      <div id="chat-window">
        {this.state.messages.map(function(message){
          return (
            <MessageDisplay
              key={message.id}
              image={message.users_image}
              name={message.users_name}
              body={message.body}
              />
          );
        })}
      </div>
    );
  }
});
