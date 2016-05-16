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
    {
      this.handlePutRank();
    }
  },

  handlePutRank: function () {
    var data = {};
    data[this.props.subject] = {};
    data[this.props.subject]["rank"] = this.state.rank;
    if (this.props.changeCharacter === "true") {
      data[this.props.subject][this.props.charAttr] = this.state.rank;
    }
    var url = "/" + this.props.subject + "/" + this.props.id;
    $.ajax({
      method: "PUT",
      url: url,
      data: data
    });
  },

  changeRender: function (){
    if (this.props.canEdit === true) {
      return (
        <div className="sm-margin row">
            <div className="input-field col s12 m6 l6">
              <span className="in-line col s6 m5 l4">{this.props.name}: </span>
              <input type="text" className="character-form col s6 m5 l4" value={this.state.rank}
                                                                          onKeyDown={this.handleDown}
                                                                          onChange={this.handleChange}/>
            </div>
        </div>
      );
    } else {
      return (
        <div className="sm-margin row">
            <div className="input-field col s12 m6 l6">
              <span className="in-line col s6 m5 l5">{this.props.name}: </span>
              <input type="text" className="character-form col s6 m5 l5" value={this.state.rank}
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
