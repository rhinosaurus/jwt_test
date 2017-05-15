//= require react
//= require react_ujs
//= require components

const authValue = document.cookie.replace(/(?:(?:^|.*;\s*)auth_token\s*\=\s*([^;]*).*$)|^.*$/, "$1");
ReactDOM.render( <Items/>, document.getElementById('react-test') )
