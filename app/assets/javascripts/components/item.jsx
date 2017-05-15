const Item = ( props ) => {
    return (
            <div>
                <span><strong>ID:</strong> {props.data.id}</span><br/>
                <span><strong>Name:</strong> {props.data.name}</span><br/>
                <span><strong>Description:</strong> {props.data.description}</span><br/><br/>
            </div>
    )
}
