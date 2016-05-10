var NewGame = React.createClass({
  getInitialState: function (){
    return {
      postText: '',
      divClass: "hide"
    };
  },

  handleClick: function (){
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
    var that = this;
    var dataToSend = {sheet: this.props.sheet_id};
    dataToSend[this.props.controller] = {};
    dataToSend[this.props.controller][this.props.name] = this.state.postText;
    $.ajax({
      method: "POST",
      url: "/" + this.props.controller + ".json",
      data: dataToSend,
      success: function(response) {
        window.location.replace("/" + that.props.redirect_controller + "/" + response.redirect_id);
      }
    }).done(function(response) {
      that.setState({
        postText: ''
      });
    });
  },

  render: function () {
    var header = this.props.display_name;
    var place = this.props.placeholder;
    return (
      <div>
        <h6 onClick={this.handleClick} className="clicky-button btn right">{header}</h6>
        <div className={this.state.divClass}>
          <input className="center"
            placeholder={place}
            value={this.state.postText}
            onKeyDown={this.handleDown}
            onChange={this.handleChange}/>
        </div>
      </div>
    );
  }
});
