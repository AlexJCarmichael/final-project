var CreatePlayer = React.createClass({
  handleClick: function () {
      this.handlePostPlayer();
    },

  handlePostPlayer: function () {
    var that = this
    $.ajax({
      method: "POST",
      url: "/users/player",
      data: {
        player: {
          user_id: this.props.user.id,
          game_session_id: this.props.game
        }
      },
      success: function(response) {
        window.location.replace("/game_sessions/" + that.props.game);
      }
    });
  },

  render: function () {
    console.log(this.props.game)
    return (<a onClick={this.handleClick}>{this.props.user.name}: {this.props.user.user_name}</a>);
  }
});
