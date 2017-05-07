var RestaurantOfTheDay = React.createClass({
  render: function () {
    return (
      <div className="medium-4 columns">
        <h4>{ this.props.name }</h4>
        <h4>{ this.props.phone }</h4>
      </div>
    )
  }
});