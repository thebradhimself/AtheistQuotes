class CRBox extends React.Component{

  constructor(props){
    super(props);
    this.adClicked = this.adClicked.bind(this);
    this.state = ({adClicked: true});
  }

  componentDidMount(){
    (adsbygoogle = window.adsbygoogle || []).push({});
  }

  adClicked(){
    this.setState({adClicked: true});
  }

  render(){

    let pass = this.state.adClicked ? "Password is 'lovewins'" : 'Click on any ad one time and the password will appear';

    let ad = (
            <ins
               className="adsbygoogle"
               style={{display:'inline-block', width:'200px', height:'200px'}}
               data-ad-client="ca-pub-5362989041036391"
               data-ad-slot="9076806811"
               data-ad-format="auto">
             </ins>
           );

   let ad2 = (
           <ins
              onClick={this.adClicked}
              className="adsbygoogle"
              style={{display:'inline-block', width:'728px', height:'90px'}}
              data-ad-client="ca-pub-5362989041036391"
              data-ad-slot="5659229618"
              data-ad-format="auto">
            </ins>
          );

    return(

      <div>
        <div>{pass}</div>
        <div>{ad2}{ad2}{ad2}{ad2}{ad2}</div>
      </div>);

  }
}
