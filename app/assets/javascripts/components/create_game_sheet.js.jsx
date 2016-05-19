var CreateGameSheet = React.createClass ({
  handlePost: function () {
    var that = this;
    $.ajax({
      method: "POST",
      url: "/sheet_templates/1/game_sheet",
      data: {
        game_sheet: {
          sheet_template_id: this.props.sheet.id,
          game_session_id: this.props.gameId
        }
      },
      success: function(response) {
        window.location.replace("/sheet_templates/" + response.redirect_id + "/?game=" + that.props.gameId);
      }
    })
  },

  render: function () {
    return (
      <p className="clicky-this" onClick={this.handlePost}>{this.props.sheet.game_name}</p>
    );
  },
});
