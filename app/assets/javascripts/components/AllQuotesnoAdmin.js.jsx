class AllQuotesnoAdmin extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    return(
      <div>
        <div dangerouslySetInnerHTML={{__html: this.props.quote }}></div>
      </div>
    );
  }
}
