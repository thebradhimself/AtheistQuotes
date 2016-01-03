class QuotesBox extends React.Component{
  constructor(props){
    super(props);
    this.state = {quotes: [], num: Math.floor((Math.random() * 1905) + 1)};
    this.nextQuote = this.nextQuote.bind(this);
    this.previousQuote = this.previousQuote.bind(this);
    this.formatQuote = this.formatQuote.bind(this);
  }
  componentWillMount(){
    $.ajax({
      url: '/getQuotes',
      method: 'GET',
      dataType: 'JSON',
    }).success(data => {
      this.setState({quotes: data});
    });
  }

  componentDidMount(){
    (adsbygoogle = window.adsbygoogle || []).push({});
  }

  nextQuote(e){
    e.preventDefault();
    if(this.state.num + 1 < this.state.quotes.length)
      this.setState({num: this.state.num + 1});
    else {
      this.setState({num: 0});
    }
  }

  previousQuote(e){
    e.preventDefault();
    if(this.state.num - 1 == -1)
      this.setState({num: this.state.quotes.length - 1});
    else {
      this.setState({num: this.state.num - 1});
    }
  }

  formatQuote(quote){
    let quote2 = ""
    $.ajax({
      url: '/formatQuote',
      method: 'GET',
      dataType: 'JSON',
      data: { quote: quote }
    }).success(data => {
      debugger;
    }).fail(err => {
      debugger;
    });
  }

  render(){
    let quote = ""
    if(this.state.quotes[this.state.num]){
      quote = this.state.quotes[this.state.num].the_quote
    }
    let ad = (
            <ins
               className="adsbygoogle"
               style={{display:'inline-block;', width:'200px;', height:'400px;'}}
               data-ad-client="ca-pub-5362989041036391"
               data-ad-slot="9076806811"
               data-ad-format="auto">
             </ins>
           )

    return(
      <div className="row">
        <div className="offset-m1 col m6">
          <div className='row buttons-row center-align'>
            <div className="btn btn-success red shadows left-align" onClick={this.previousQuote}>Previous Quote</div>
            <div className="btn btn-success red shadows right-align" onClick={this.nextQuote}>Next Quote</div>
          </div>
          <div className="row center-align">
            <div className="special center-align" dangerouslySetInnerHTML={{__html: quote }}></div>
          </div>
          <div className="center-align">
            <a href="https://itunes.apple.com/us/app/atheist-quotes./id392507328?mt=8"><img className="app-buttons" src="http://www.atheist-quotes.com/assets/download_on_app_store_badge-cdd21a520305761890b1da6e15d6151e41d57064668b0deee6bef30e714bc4c9.png"/></a>
            <a href="https://play.google.com/store/apps/details?id=com.leftblank.atheistquotes"><img className="app-buttons" src="http://www.atheist-quotes.com/assets/get-it-on-google-play-583b7d95966b951ab801b5d4651ed5eca6663e749dceabacc992b3546b2f46ef.png"/></a>
          </div>
        </div>
        <div className="offset-m2 col m2 center-align">
          {ad}
        </div>
      </div>
    );
  }
}
