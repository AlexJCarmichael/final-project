var EquipmentSearch = React.createClass({
  getInitialState: function(){
    return {
      equipment: [],
      filteredEquipment: [],
      search: "",
      divClass: "hide"
    };
  },

  handleClick: function (){
    if (this.state.divClass === "hide") {
      this.setState({divClass: ""});
    }else {
      this.setState({divClass: "hide"});
    }
  },

  filterList: function(event){
    var searchReturn = this.state.equipment.filter(function (equipment) {
      return (equipment.name.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1 ||
              equipment.category.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1 ||
              equipment.sub_category.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1);
    });
    this.setState({
      filteredEquipment: searchReturn,
      search: event.target.value
    });
  },

  whichMount: function () {
    var that = this;
    var url = '/equipment/';
    if (this.props.searchFor ===  "character_equipment") {
        url = "/equipment/" + this.props.gameId + "/character";
    }
    $.ajax({
      url: url,
      dataType: "JSON",
      method: "get"
    }).done(function (response) {
      that.setState({
        equipment: response,
        filteredEquipment: []
      });
    });
  },

  componentDidMount: function () {
    this.whichMount()
  },

  equipmentDisplay: function(user){
    var that = this;
    if (this.state.search.length > 1) {
        return this.state.filteredEquipment.map(function (equip){
            return (<Equipment
                      key={equip.id}
                      equip={equip}
                      isGM={that.props.isGM}
                      searchFor={that.props.searchFor}
                      char_id={that.props.characterId}
                      game_id = {that.props.gameId}/>);
        });
    } else {
      return (<span></span>);
    }
  },

  headerText: function () {
    if (this.props.isGM === true) {
      return ("+");
    } else if (this.props.searchFor === "character_equipment") {
      return ("+");
    } else {
      return ("View this  game's items");
    }
  },

  addAnItem: function () {
    if (this.props.isGM === true) {
      return (<p className="center-text"><strong>Click on an item to add it</strong></p>);
    } else {
      return (<p className="center-text"><strong>Search for items</strong></p>);
    }
  },

  render: function() {
    return (
      <div>
        <h6 onClick={this.handleClick} className="clicky-button btn">{this.headerText()}</h6>
        <div className={this.state.divClass}>
          <input className= "upper-margin" type="text"
                onChange={this.filterList}
                value={this.state.search}
                placeholder="Equipment Name or Category or Sub Category" />
          {this.addAnItem()}
        </div>
        <div>
          {this.equipmentDisplay()}
        </div>
      </div>
    );
  },
});
