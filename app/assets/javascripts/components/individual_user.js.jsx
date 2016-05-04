var IndividualUser = React.createClass({
  render: function(){
    var url = "/user/" + this.props.userId;
    var that = this;
    return(
      <span>
        {this.props.characters.map(function(character){
          var charUrl = "/characters/" + character.id;
          return (
            <p key={character.id}> <a href={url}>{that.props.name} </a> as <a href={charUrl}>{character.name}</a> </p>
          );
        })}
      </span>
    )
  }
});
