class CRBox extends React.Component{

  constructor(props){
    super(props);
  }

  componentDidMount(){
    (adsbygoogle = window.adsbygoogle || []).push({});
  }

  render(){

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
              className="adsbygoogle"
              style={{display:'inline-block', width:'728px', height:'90px'}}
              data-ad-client="ca-pub-5362989041036391"
              data-ad-slot="5659229618"
              data-ad-format="auto">
            </ins>
          );

    return(

      <div>
        <div>Click on any ad one time and password appear.</div>
        <div>{ad}</div>
        <div>{ad2}</div>
      </div>);

  }
}
