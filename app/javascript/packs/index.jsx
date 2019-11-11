import React from 'react'
import ReactDOM from 'react-dom'
import '../../../node_modules/bootstrap/dist/css/bootstrap.css'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import App from '../components/Application/App'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Router>
      <Route path="/" component={App} />
    </Router>,
    document.body.appendChild(document.createElement('div')),
  )
})
