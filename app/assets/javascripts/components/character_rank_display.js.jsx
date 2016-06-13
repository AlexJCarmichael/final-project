/* globals  React */
/* exported CharacterRankDisplay */
var CharacterRankDisplay = React.createClass({

    render: function() {
        var headerName = this.props.headerName;
        var that = this;
        return (
            <div className="col s12 m6 l6">
                <h6>{headerName}</h6>
                {this.props.charAttributes.map(function(stat) {
                    return (<MakeRank subject={that.props.subject} key={stat.id} id={stat.id} name={stat.name} rank={stat.rank} canEdit={that.props.canEdit}/>);
                })}
            </div>
        );
    }
});
