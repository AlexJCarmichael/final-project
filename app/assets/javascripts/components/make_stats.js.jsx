var MakeStats = React.createClass({
  getInitialState: function(){
    return {
      rankValue: this.props.rank,
      input: "",
    };
  },
  render: function() {
    return (
      <div className="sm-margin row">
          <div className="input-field col s6">
            <span className="in-line col s4 m3 l2">{this.props.name}: </span>
            <input type="text" className="character-form col s3 m3 l1" value={this.props.rank}/>
          </div>
      </div>
    );
  }
});
