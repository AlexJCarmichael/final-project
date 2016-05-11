var MessageDisplay = React.createClass({
  render: function(){
    return (
      <div className="lil-space row">
        <div className='col s2'>
          <strong>  {this.props.name}:  </strong>
        </div>
        <div className='col s10'>
          <span style={{whiteSpace: 'pre'}}> {this.props.body} </span>
        </div>
      </div>
    );
  }
});
