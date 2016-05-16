var GameEquipment = React.createClass({
  render: function () {
    var url = "/equipment/" + this.props.equip_id +  "/char_equip?char_id=" + this.props.char_id
    return (<p>
              <a rel="nofollow" data-method="POST" href={url}>
                {this.props.equipCategory}: {this.props.equipSubCategory}: {this.props.equipName}
              </a>
            </p>);
  }
});
