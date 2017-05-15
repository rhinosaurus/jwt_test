class Items extends React.Component {
    
    constructor() {
        super();
        this.state = { items: [] }
        this.update = this.update.bind( this );
    }

    update( items ) {
        this.setState({
            items: items
        });
    }

    fetchItems() {
        fetch( '/api/v1/items', {
            method: 'GET',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-Type': 'application/json',
                'Authorization': authValue
            }
        } ).then( (resp) => {
            return resp.json();
        }).then( (resp) => {
            this.update( resp );
        });
    }

    componentWillMount() {
        this.fetchItems();
    }

    render() {
        const itemList = this.state.items.map( item => {
            return <Item key={item.id} data={item}/>
        } );

        return (
            <div>
                {itemList}
            </div>
        )
    }
}
