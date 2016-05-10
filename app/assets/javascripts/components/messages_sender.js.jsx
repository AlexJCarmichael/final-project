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
        this.state.messageText + "\n"
      }
    if (event.keyCode === 13) {
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
          chat_session_id: this.props.chatId
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
        <textarea row={40} cols={40}
                placeholder="Send a message"
                value={this.state.messageText}
                onKeyDown={this.handleDown}
                onChange={this.handleChange}/>
      </div>
    );
  }
});
