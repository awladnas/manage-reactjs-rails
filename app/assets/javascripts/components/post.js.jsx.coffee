class @Post extends React.Component

  handleDelete:(e) =>
    e.preventDefault()

    console.log @props
    $.ajax
      method: 'DELETE',
      url: "/posts/#{@props.post.id}",
      dataType: 'JSON',
      success: ()=>
        console.log(" aa #{@props.post.id}")
        @props.handleDelete @props.post

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.post.content
      React.DOM.td null, @props.post.author
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
