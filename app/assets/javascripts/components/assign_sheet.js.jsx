var AssignSheet = React.createClass ({
  getInitialState: function (){
    return {
      postText: '',
      divClass: "hide"
    };
  },

  handleClick1: function (){
    if (this.state.divClass === "hide") {
      this.setState({divClass: ""});
    }else {
      this.setState({divClass: "hide"});
    }
  },

  handleChange: function (event) {
      this.setState({
        postText: event.target.value
    });
  },

  handleDown: function (event) {
    if (event.keyCode === 13) {
      this.handlePost();
    }
  },

  handlePost: function () {
    $.ajax({
      method: "POST",
      url: "/sheet_templates/",
      data: {
        sheet_template: {
          game_name: this.state.postText,
          game_id: this.props.gameId
        }
      },
      success: function(response) {
        window.location.replace("/sheet_templates/" + response.redirect_id);
      }
    })
  },

  render: function () {
    return (
    <div>
      <p onClick={this.handleClick1} className="clicky-button"><strong>Do you want to create your own sheet for this game?</strong></p>
      <div className={this.state.divClass}>
        <input className="center"
          placeholder="Name the Sheet Template"
          value={this.state.postText}
          onKeyDown={this.handleDown}
          onChange={this.handleChange}/>
      </div>
      <p onClick={this.handleClick2} className="clicky-button"><strong>Do you want to use a sheet that already exists?</strong></p>
    </div>
    );
  }
});
