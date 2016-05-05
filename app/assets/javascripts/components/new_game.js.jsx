var NewGame = React.createClass({
  getInitialState: function (){
    return {
      gameText: ''
    };
  },

  handleChange: function (event) {
      this.setState({
        gameText: event.target.value
    });
  },

  handleDown: function (event) {
    if (event.keyCode === 13) {
      this.handlePostGame();
    }
  },

  handlePostGame: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: "/game_sessions.json",
      data: {
        game_session: {
          session_name: this.state.gameText
        }
      },
      success: function(response) {
        window.location.replace("/game_sessions/" + response.game_id);
      }
    }).done(function(response) {
      that.setState({
        gameText: ''
      });
    });
  },

  render: function () {
    return (
      <div className="hidden-form hide">
        <textarea row={40} cols={40}
                placeholder="Name your game"
                value={this.state.gameText}
                onKeyDown={this.handleDown}
                onChange={this.handleChange}/>
      </div>
    );
  }
});
