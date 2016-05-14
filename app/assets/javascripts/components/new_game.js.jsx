var NewGame = React.createClass({
  getInitialState: function (){
    return {
      gameName: '',
      startTime: ''
    };
  },

  handleChange: function (event) {
      this.setState({
        gameName: event.target.value
    });
  },

  handleChange2: function (event) {
      this.setState({
        startTime: event.target.value
    });
  },

  handlePost: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: "/game_sessions.json",
      data: {
        game_sessions: {
          session_name: this.state.gameName,
          game_time: this.state.startTime,
        }
      },
      success: function(response) {
        window.location.replace("/game_session/" + response);
      }
    })
  },

  render: function () {
    return (
      <div>
        <h6>Name your game</h6>
        <div>
          <input className="center"
            placeholder="The Peril of Xanderfall"
            value={this.state.gameName}
            onChange={this.handleChange}/>
        </div>
        <h6>When will you play?</h6>
        <div>
          <input className="center"
            placeholder="Monday 7pm"
            value={this.state.startTime}
            onChange={this.handleChange2}/>
        </div>
        <a className="btn" onClick={this.handlePost}>Create Game</a>
      </div>
    );
  }
});
