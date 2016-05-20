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

  handleUp: function (event) {
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

  hideZeroRank: function (){
    if (this.state.rank === 0) {
      return (
        <span></span>
      );
    } else {
      return (
            <div>
              <label className="in-line col s6 m6 l6">{this.props.name}: </label>
              <input type="text" className="character-form col s6 m3 l3" value={this.state.rank}
                                                                          onKeyDown={this.handleDown}
                                                                          disabled='true'
                                                                          onChange={this.handleChange}/>
            </div>
      );
    }
  },

  changeRender: function (){
    if (this.props.canEdit === true) {
      return (
            <div className="row">
              <label htmlFor={this.props.name + this.props.id} className="in-line col s6 m6 l5">{this.props.name}: </label>
              <input  id={this.props.name + this.props.id} type="text" className="character-form col s4 m4 l5" value={this.state.rank}
                                                                          onKeyUp={this.handleUp}
                                                                          onChange={this.handleChange}/>
            </div>
      );
    } else {
      return (
        this.hideZeroRank()
      );
    }
  },

  render: function() {
    return (
      this.changeRender()
    );
  },
});
