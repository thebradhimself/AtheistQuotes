// class Favorites extends React.Component{
//   constructor(props){
//     super(props);
//     this.state = {favorites: this.props.favorites};
//     this.removeFavorite = this.removeFavorite.bind(this);
//   }
//
//   removeFavorite(quoteId){
//     $.ajax({
//       url: '/removeFavorite',
//       type: 'GET',
//       data: {id: quoteId}
//     }).success(data =>{
//       this.setState({favorites: data.favorites});
//     });
//   }
//
//
//
//   render(){
//
//     let favorites = this.state.favorites.map(fav => {
//       return(<Favorite key={`fav-${fav.id}`} favorite={fav} removeFavorite={this.removeFavorite} />);
//     });
//     return(<div>
//             <table className="striped">
//               <tbody>
//                 { favorites }
//               </tbody>
//             </table>
//            </div>);
//
//   }
// }
