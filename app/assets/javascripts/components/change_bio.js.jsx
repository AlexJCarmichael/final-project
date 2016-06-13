/* globals $, React */
/* exported ChangeBio */
var ChangeBio = React.createClass({
    getInitialState: function() {
        return {bio: this.props.bio};
    },

    handleChange: function(event) {
        this.setState({bio: event.target.value});
    },

    handleUp: function() {
        {
            this.handlePutBio();
        }
    },

    handlePutBio: function() {
        $.ajax({
            method: "PUT",
            url: "/characters/" + this.props.id,
            data: {
                characters: {
                    bio: this.state.bio
                }
            }
        });
    },

    properRender: function() {
        if (this.props.canEdit === true) {
            return (
              <div>
                  <input id={this.props.name + this.props.id} type="text" value={this.state.bio} onKeyUp={this.handleUp} onChange={this.handleChange}/>
              </div>
          );
        } else {
            return(
              <div>
                  <input id={this.props.name + this.props.id} type="text" disable="true" value={this.state.bio} onKeyUp={this.handleUp} onChange={this.handleChange}/>
              </div>
          );
        }
    },

    render: function() {
        return (this.properRender());
    }
});
