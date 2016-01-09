class Favorite extends React.Component{

  constructor(props){
    super(props);
    this.state = {quote: ""};
  }

  componentDidMount(){
    $.ajax({
      url: '/getFavoriteQuote',
      type: 'GET',
      data: {id: this.props.favorite.quote_id}
    }).success(data => {
      this.setState({quote: data.quote});
    });
  }

  render(){
    return(
      <tr><td dangerouslySetInnerHTML={{__html: this.state.quote }}></td><td><i className="fa fa-heart fa-2x" onClick={() => this.props.removeFavorite(this.props.favorite.quote_id)}></i></td></tr>
    );
  }

}
