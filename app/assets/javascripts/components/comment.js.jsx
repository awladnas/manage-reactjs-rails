var Comment = React.createClass({
    getInitialState() {
        return {
            comment: this.props.comment
        }
    },

    render() {
        return (
            <tr>
                <td>{this.state.comment.author}</td>
                <td>{this.state.comment.text}</td>
            </tr>
        );
    }
});

