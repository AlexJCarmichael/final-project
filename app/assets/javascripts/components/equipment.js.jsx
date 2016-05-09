var Equipment = React.createClass({
  properDisplay: function(){
    if (this.props.isGM === true) {
      var url = "/equipment/" + this.props.equip.id +  "/gameequip?game_id=" + this.props.game_id
      return (<p>
                <a rel="nofollow" data-method="POST" href={url}>
                  {this.props.equip.category}: {this.props.equip.sub_category}: {this.props.equip.name}
                </a>
              </p>);
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
      )
    }
  },

  render: function () {
    return (
      <div>
        {this.properDisplay()}
      </div>
    );
  },
});
