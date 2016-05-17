var MessageDisplay = React.createClass({
  render: function(){
    return (
      <div className="lil-space row">
        <div className="col s2">
          <img className="responsive-img circle z-depth-1 sml-left-margin" src={this.props.image} />
        </div>
        <div className="row col s10">
          <div className='col s12'>
            <strong>{this.props.name}:</strong>
          </div>
          <div className='col s12'>
            <span style={{whiteSpace: 'pre-wrap', wordWrap: 'break-word'}}>{this.props.body}</span>
          </div>
        </div>
      </div>
    );
  }
});
