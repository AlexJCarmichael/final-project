var MessagesSender = React.createClass({
  getInitialState: function (){
    return {
      messageText: ''
    };
  },

  handleChange: function (event) {
      this.setState({
        messageText: event.target.value
    });
  },

  handleDown: function (event) {
    if (event.shiftKey && event.keyCode === 13) {
        this.setState({
          messageText: this.state.messageText
        });
      } else if (event.keyCode === 13) {
      this.handlePostMessage();
    }
  },

  handlePostMessage: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: "/messages",
      data: {
        message: {
          body: this.state.messageText,
          chat_session_id: this.props.chatId,
          chat_type: this.props.chatType
        }
      }
    }).done(function(response) {
      that.setState({
        messageText: ''
      });
    });
  },

  render: function(){
    return (
      <div>
        <textarea className="message-sender"
                placeholder="Send a message"
                value={this.state.messageText}
                onKeyDown={this.handleDown}
                onChange={this.handleChange}/>
      </div>
    );
  }
});
