var MessagesSender = React.createClass({
  // getInitialState: function () {
  //   return {
  //     messages: []
  //   };
  // },
  //
  // tick: function() {
  //   var that = this;
  //   var url = '/messages';
  //   var chatWindow = document.getElementById("chat-window");
  //   var isScrolledToBottom = chatWindow.scrollHeight - chatWindow.clientHeight <= chatWindow.scrollTop + 5;
  //   $.getJSON(url, function(response){
  //     console.log(response);
  //     that.setState({
  //       messages: response
  //     })
  //     if(isScrolledToBottom)
  //       chatWindow.scrollTop = chatWindow.scrollHeight - chatWindow.clientHeight;
  //   });
  // },
  //
  // componentDidMount: function() {
  //   this.interval = setInterval(this.tick, 1000);
  // },
  //
  // componentWillUnmount: function() {
  //   clearInterval(this.interval);
  // },

  render: function() {
    return (
      <div id="chat-window">
      <p>Yo</p>
        // this.state.messages.map(function(message){
        //   return (
          //   <MessageDisplay
          //     key={message.id}
          //     user_name={message.user_name}
          //     body={message.body}
          //     />
          // );
        })}
      </div>
    );
  }
});
