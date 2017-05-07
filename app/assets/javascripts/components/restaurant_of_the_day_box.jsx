var RestaurantOfTheDayBox = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.all_restaurants);
  },

  render: function () {
    return (
      <div className="suggested-restaurants-box">
        <RestaurantOfTheDayList suggested_restaurants={ this.state.suggested_restaurants } />
      </div>
    );
  }
});