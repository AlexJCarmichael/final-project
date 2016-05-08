var TemplateSearch = React.createClass({
    getInitialState: function(){
      return {
        allTemplates: [],
        filteredTemplates: [],
        search: ""
      };
    },

    filterList: function(event){
      var searchReturn = this.state.allTemplates.filter(function (template) {
        return (template.game_name.toLowerCase().indexOf(event.target.value.toLowerCase()) !==-1);
      });
      this.setState({
        filteredTemplates: searchReturn,
        search: event.target.value
      });
    },

    componentDidMount: function () {
      var that = this
      $.ajax({
        url: "/sheet_templates/",
        dataType: "JSON",
        method: "get"
      }).done(function (response) {
        that.setState({
          allTemplates: response,
          filteredTemplates: []
        });
      })
    },

    sheetNames: function(user){
      var that =this;
      if (this.state.search.length > 1) {
        return this.state.filteredTemplates.map(function (sheet){
            return (<CreateGameSheet
                      key={sheet.id}
                      sheet={sheet}
                      gameId={that.props.gameId}/>);
          });
      } else {
        return (<span></span>);
      }
    },

    render: function() {
      return (
        <div>
          <div>
            <input type="text"
            onChange={this.filterList} value={this.state.search}
            placeholder="Sheet Template name" />
          </div>
          <div>
            {this.sheetNames()}
          </div>
          <strong className="center-text">Click on a template to select it</strong>
        </div>
      );
    },
  });
