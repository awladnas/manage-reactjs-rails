var Comments = React.createClass({

    render: function() {
        comments = this.props.comments.map( function(comment) {
            return (
                <Comment comment={comment} key={comment.id} />
            );
        });
        return (
            <div>
                <h1>Comments</h1>
                <div id="comments">
                    <table>
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Comment</th>
                        </tr>
                        </thead>
                        <tbody>
                        {comments}
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
});
