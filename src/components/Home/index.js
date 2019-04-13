import React from 'react';

import ReactDOM from 'react-dom'
import Web3 from 'web3'
import './index.css'

import { withAuthorization } from '../Session';

class HomePage extends React.Component {
  constructor(props){
     super(props)
     this.state = {
        lastWinner: 0,
        timer: 0
     }
  }
voteNumber(number){
     console.log(number)
  }
render(){
     return (
        <div className="main-container">
           <h1>Invest in your favourite project</h1>
<hr/>
<h2>Vote for the next number</h2>
           <ul>
              <li onClick={() => {this.voteNumber(1)}}>1</li>
              <li onClick={() => {this.voteNumber(2)}}>2</li>
              <li onClick={() => {this.voteNumber(3)}}>3</li>
              <li onClick={() => {this.voteNumber(4)}}>4</li>
              <li onClick={() => {this.voteNumber(5)}}>5</li>
           </ul>
        </div>
     )
  }
}
ReactDOM.render(
  <HomePage />,
  document.querySelector('#root')
)

const condition = authUser => !!authUser;

export default withAuthorization(condition)(HomePage);