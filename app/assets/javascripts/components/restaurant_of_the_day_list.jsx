var RestaurantOfTheDayList = React.createClass({
  render: function () {
    var suggestedRestaurantNodes = this.props.suggested_restaurants.map(function ( restaurant, i ) {
      return <RestaurantOfTheDay key={i} name={ restaurant.name } phone= { restaurant.phone } />
    });

    return (
      <div className="suggested-restaurants-list">
        <div className="row">
          { suggestedRestaurantNodes }
        </div>
      </div>
    )
  }
});