// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { ApolloProvider } from "react-apollo";
import { client } from '../../constants/index'
import ProfileComponent from './components/ProfileComponent';
class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <div className="App">
          <header>
            <h1>Fab Look</h1>
            <h3>-----------------NAV BAR HERE------------------------------</h3>
          </header>
          <div className="Body">
            <ProfileComponent />
          </div>
        </div>
      </ApolloProvider>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
