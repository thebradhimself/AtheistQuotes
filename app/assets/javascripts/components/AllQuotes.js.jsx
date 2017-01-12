class AllQuotes extends React.Component{
  constructor(props){
    super(props);
    this.handleEdit = this.handleEdit.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
    this.state = {edit_mode: false, quote: this.props.quote, author: this.props.author}
  }

  handleEdit(){
    this.setState({ edit_mode: !this.state.edit_mode });
  }

  handleUpdate(){
    $.ajax({
      url: '/update',
      method: 'POST',
      dataType: 'JSON',
      data: {id: this.props.quote_id, quote: ReactDOM.findDOMNode(this.refs.quoted_quote).value, author:  ReactDOM.findDOMNode(this.refs.authored_author).value }
    }).success(data => {
      this.setState({ edit_mode: !this.state.edit_mode, quote: data.quote.quote, author: data.quote.author })
    }).fail(data => {
      console.log(data);
    })
  }

  render(){

    if(this.state.edit_mode){
      return(
        <div>
          <input ref="quoted_quote" defaultValue={this.state.quote }></input>
          <input ref="authored_author" defaultValue={this.state.author}></input>
          <button onClick={this.handleUpdate}>Save</button>
        </div>
      );
    }
    else{
      return(
        <div>
          <p>{this.state.quote}</p>
          <div>{this.state.author}</div>
          <button onClick={this.handleEdit}>Edit</button>
        </div>
      );
    }
  }
}
