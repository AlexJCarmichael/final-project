var MessageDisplay = React.createClass({
  render: function(){
    return (
      <div className="lil-space">
        <strong>  {this.props.name}:  </strong>
        <span> {this.props.body} </span>
      </div>
    );
  }
});
