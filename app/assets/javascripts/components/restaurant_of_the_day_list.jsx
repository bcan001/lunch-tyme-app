var RestaurantOfTheDayList = React.createClass({
  render: function () {
    var suggestedRestaurantNodes = this.props.suggested_restaurants.map(function ( restaurant, i ) {
      return <RestaurantOfTheDay key={i} name={ restaurant.name } phone= { restaurant.phone } image_url={ restaurant.image_url } rating_img_url_small={ restaurant.rating_img_url_small } id={ restaurant.id } />
    });

    return (
      <div className="suggested-restaurants-list">
        <div className="row ctr">
          { suggestedRestaurantNodes }
        </div>
      </div>
    )
  }
});