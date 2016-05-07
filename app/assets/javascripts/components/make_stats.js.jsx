var MakeRank = React.createClass({
  getInitialState: function() {
    return {
      rank: this.props.rank
    }
  },

  handleChange: function (event) {
      this.setState({
        rank: event.target.value
    });
  },

  handleDown: function (event) {
    if (event.keyCode === 13) {
      this.handlePutRank();
    }
  },

  handlePutRank: function () {
    $.ajax({
      method: "PUT",
      url: "/"+ this.props.subject +"/" + this.props.id,
      data: {
        stats: {
          rank: this.state.rank
        }
      }
    });
  },

  render: function() {
    return (
      <div className="sm-margin row">
          <div className="input-field col s6">
            <span className="in-line col s4 m3 l2">{this.props.name}: </span>
            <input type="text" className="character-form col s3 m3 l2" value={this.state.rank}
                                                                        onKeyDown={this.handleDown}
                                                                        onChange={this.handleChange}/>
          </div>
      </div>
    );
  }
});
