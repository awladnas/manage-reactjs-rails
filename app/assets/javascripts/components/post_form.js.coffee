@PostForm = React.createClass
  getInitialState: ->
    content: ''
    author: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}" : e.target.value

  valid: ->
    @state.content && @state.author

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '',{post: @state}, (data) =>
      @props.addPost data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Content'
          name: 'content'
          value: @state.content
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Author'
          name: 'author'
          value: @state.author
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Post'
