var MakeStats = React.createClass({
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

  changeRender: function (){
    if (this.props.canEdit === true) {
      return (
        <div className="sm-margin row">
            <div className="input-field col s7">
              <span className="in-line col s6 m3 l2">{this.props.name}: </span>
              <input type="text" className="character-form col s6 m3 l2" value={this.state.rank}
                                                                          onKeyDown={this.handleDown}
                                                                          onChange={this.handleChange}/>
            </div>
        </div>
      );
    } else {
      return (
        <div className="sm-margin row">
            <div className="input-field col s7">
              <span className="in-line col s6 m3 l2">{this.props.name}: </span>
              <input type="text" className="character-form col s6 m3 l2" value={this.state.rank}
                                                                          onKeyDown={this.handleDown}
                                                                          disabled='true'
                                                                          onChange={this.handleChange}/>
            </div>
        </div>
      );
    }
  },

  render: function() {
    return (
      this.changeRender()
    );
  },
});
