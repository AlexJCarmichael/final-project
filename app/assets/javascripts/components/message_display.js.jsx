var MessageDisplay = React.createClass({
  render: function(){
    return (
      <div className="row">
      <strong className="col s3">  {this.props.user_name}  </strong>
            <span className="col s9">
              {this.props.body}
            </span>
      </div>
    );
  }
});
