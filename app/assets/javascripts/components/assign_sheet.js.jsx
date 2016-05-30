var AssignSheet = React.createClass ({
  getInitialState: function (){
    return {
      postText: '',
    };
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
    that = this;
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
        window.location.replace("/sheet_templates/" + response.redirect_id + "/?game=" + that.props.gameId);
      }
    })
  },

  render: function () {
    return (
    <div>
      <p id="template-create"><strong>Do you want to create your own sheet for this game?</strong></p>
      <div>
        <input className="center"
          id="new-template-field"
          placeholder="Name the Sheet Template"
          value={this.state.postText}
          onKeyDown={this.handleDown}
          onChange={this.handleChange}/>
          <h6 className="center">Press enter to create a sheet</h6>
      </div>
      <p id="template-search"><strong>Do you want to use a sheet that already exists?</strong></p>
      <div>
        <TemplateSearch
          gameId={this.props.gameId}
        />
      </div>
    </div>
    );
  }
});
