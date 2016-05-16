var Equipment = React.createClass({
  ableToAdd: function () {
    var url = "/equipment/" + this.props.equip.id +  "/game_equip?game_id=" + this.props.game_id
    if (this.props.otherEq.includes(this.props.equip.id)){
      return (<p>
                <a rel="nofollow" data-method="POST" href={url}>
                {console.log(this.props.equip.name)}
                  {this.props.equip.category}: {this.props.equip.sub_category}: {this.props.equip.name}
                </a>
              </p>);
    } else {
      return (<p>
                {this.props.equip.category}: {this.props.equip.sub_category}: {this.props.equip.name}
              </p>);
    }
  },

  properDisplay: function(){
    if (this.props.isGM === true) {
        return (this.ableToAdd());
    } else if (this.props.searchFor === "character_equipment"){
      return (
        <GameEquipment
        equipCategory={this.props.equip.category}
        equipSubCategory={this.props.equip.sub_category}
        equipName={this.props.equip.name}
        equip_id={this.props.equip.id}
        char_id={this.props.char_id}/>
      );
    } else {
      return (
        <p>{this.props.equip.category}: {this.props.equip.sub_category}: {this.props.equip.name}</p>
      );
    }
  },

  render: function () {
    return (
      <div className="plain">
        {this.properDisplay()}
      </div>
    );
  },
});
