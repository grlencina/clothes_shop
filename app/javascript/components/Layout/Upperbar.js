import React from 'react'
import LogInButton from './LogInButton'
import LogOutButton from './LogOutButton'

class Upperbar extends Component {
    constructor(){
        super(props)
        this.state = {
            items: [],
        };
    }

    componentDidMount(){

    }
    
    render(){
        return (
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand" href="#">Clothes shop</a>
                <div class="d-flex flex-row-reverse">
                    { user_signed_in? 
                        <LogInButton/>
                        : <LogOutButton/>    
                    }    
                </div>
            </nav>
            
            
        )
    }    
}

export default Upperbar