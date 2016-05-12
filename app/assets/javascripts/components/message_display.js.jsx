var MessageDisplay = React.createClass({
  render: function(){
    return (
      <div className="lil-space row">
        <div className="col s2">
          <img className="z-depth-2 circle responsive-img" src={this.props.image} />
        </div>
        <div className='col s2'>
          <strong>{this.props.name}:</strong>
        </div>
        <div className='col s10'>
          <span style={{whiteSpace: 'pre-wrap', wordWrap: 'break-word'}}>{this.props.body}</span>
        </div>
      </div>
    );
  }
});
