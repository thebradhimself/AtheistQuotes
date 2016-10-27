class QuotesBox extends React.Component{
  constructor(props){
    super(props);
    this.state = {favorited: false, quotes: [], favorites: [], num: Math.floor((Math.random() * 1905) + 1)};
    this.nextQuote = this.nextQuote.bind(this);
    this.previousQuote = this.previousQuote.bind(this);
    this.favoriteIt = this.favoriteIt.bind(this);
    this.checkFavorite = this.checkFavorite.bind(this);
    this.signin = this.signin.bind(this);
  }
  componentWillMount(){
    $.ajax({
      url: '/getQuotes',
      method: 'GET',
      dataType: 'JSON',
    }).success(data => {
      this.setState({...data});
    });
  }

  componentDidMount(){
    (adsbygoogle = window.adsbygoogle || []).push({});
  }

  favoriteIt(){
    $.ajax({
      url: '/favoriting',
      method: 'GET',
      dataType: 'JSON',
      data: {id: this.state.quotes[this.state.num].id},
    }).success(data => {
      this.setState({favorited: data.checked});
    });

  }

  nextQuote(e){
    e.preventDefault();
    if(this.state.num + 1 < this.state.quotes.length)
      this.setState({num: this.state.num + 1});
    else
      this.setState({num: 0});
    this.checkFavorite(this.state.num + 1);
  }

  previousQuote(e){
    e.preventDefault();
    if(this.state.num - 1 == -1)
      this.setState({num: this.state.quotes.length - 1});
    else {
      this.setState({num: this.state.num - 1});
    }
    this.checkFavorite(this.state.num - 1);

  }

  checkFavorite(num){
    let quoteId = this.state.quotes[num].id;
    $.ajax({
      url: '/check_favorite',
      type: 'GET',
      dataType: 'JSON',
      data: {id: quoteId},
    }).success(data => {
      this.setState({favorited: data.checked})
    })
  }

  signin(){
    alert('Sign up or Login for the ability to favorite quotes!');
  }

  render(){
    let favorited = false;
    let quote = ""
    if(this.state.quotes[this.state.num]){
      quote = this.state.quotes[this.state.num].the_quote
    }
    let ad = (
            <ins
               className="adsbygoogle"
               style={{display:'inline-block', width:'200px', height:'400px'}}
               data-ad-client="ca-pub-5362989041036391"
               data-ad-slot="9076806811"
               data-ad-format="auto">
             </ins>
           );
    let favorite_icon = (<i className="fa fa-heart-o fa-3x" onClick={this.signin}></i>)
    if(this.state.user){
      favorite_icon = this.state.favorited ? (<i className="fa fa-heart fa-3x" onClick={this.favoriteIt}></i>) : (<i className="fa fa-heart-o fa-3x" onClick={this.favoriteIt}></i>)
    }
    return(
      <div>
        <div className="row">
          <div className="col m6 center-align">
            <div className="row center-align">
              <div className="special center-align" dangerouslySetInnerHTML={{__html: quote }}>
              </div>
            </div>
            <div>
              <a href="https://itunes.apple.com/us/app/atheist-quotes./id392507328?mt=8"><img className="app-buttons" src="/assets/download_on_app_store_badge.png"/></a>
              <a href="https://play.google.com/store/apps/details?id=com.leftblank.atheistquotes"><img className="app-buttons2" src="/assets/get-it-on-google-play.png"/></a>
            </div>

          </div>
          <div className="center-align col s12 m3">
            <div className="btn btn-success grey darken-1 shadows fix-that-width" onClick={this.previousQuote}>Previous</div>
            <div className="btn btn-success grey darken-1 shadows fix-that-width" onClick={this.nextQuote}>Next</div>
            <div className="row">
              {favorite_icon}
              <a href={`https://twitter.com/intent/tweet?text=${quote}`} target="blank">
                <i className="fa fa-twitter fa-3x"></i>
              </a>
            </div>
          </div>
          <div className="center-align col s12 m3">
            {ad}
          </div>
        </div>
      </div>
    );
  }
}
