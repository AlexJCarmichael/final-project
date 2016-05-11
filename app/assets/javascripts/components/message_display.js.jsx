var MessageDisplay = React.createClass({
  render: function(){
    return (
      <div className="lil-space row">
        <div className='col s2 offset-s1'>
          <strong>{this.props.name}:</strong>
        </div>
        <div className='col s10 offset-s1'>
          <span style={{whiteSpace: 'pre-wrap', wordWrap: 'break-word'}}>{this.props.body}</span>
        </div>
      </div>
    );
  }
});
