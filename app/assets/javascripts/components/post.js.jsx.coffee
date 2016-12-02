
class @Post extends React.Component

  constructor:(props) ->
    super(props)
    @state = {edit: false}

  getInitialState: =>
    edit: false

  getDefaultValue: =>
    edit: false

  handleToggle: (e) =>
    e.preventDefault()

    @setState edit: !@state.edit


  handleDelete:(e) =>
    e.preventDefault()
    $.ajax
      method: 'DELETE',
      url: "/posts/#{@props.post.id}",
      dataType: 'JSON',
      success: ()=>
        @props.handleDelete @props.post

  handleEdit: (e) =>
    e.preventDefault()
    data =
      content: ReactDOM.findDOMNode(@refs.content).value
      author: ReactDOM.findDOMNode(@refs.author).value

    $.ajax
      method: 'PUT'
      url: "/posts/#{ @props.post.id }"
      dataType: 'JSON'
      data:
        post: data
      success: (data) =>
        @setState edit: false
        @props.editPost @props.post, data


  recordRow: ->
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

  recordForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.textarea
          className: 'form-control'
          type: 'text'
          defaultValue: @props.post.content
          ref: 'content'

      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.post.author
          ref: 'author'

      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit.bind(this)
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle.bind(this)
          'Cancel'

  render: ->
    if @state && @state.edit
      @recordForm()
    else
      @recordRow()
