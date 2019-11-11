import React from 'react'

class Home extends Component {
    constructor(){
        super(props)
        this.state = {
            items: [],
        };
    }

    componentDidMount(){
        this.setState({
            items: this.props.items
        })
    }
    
    render(){
        return (
            <div className="container" >
                
            HEllo World
            </div>
        )
    }    
}

export default Home