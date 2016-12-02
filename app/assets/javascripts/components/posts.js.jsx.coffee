#class @Posts extends React.Component
@Posts = React.createClass
  getInitialState:->
    posts: @props.posts

  addPost: (post) ->
    posts = @state.posts.slice()
    posts.push post
    @setState posts: posts

  deletePost: (post) ->
    posts = @state.posts.slice()
    index = posts.lastIndexOf(post)
    posts.splice index, 1
    @replaceState posts: posts

  editPost:(post, data) ->
    index = @state.posts.indexOf post
    posts = React.addons.update(@state.posts, { $splice: [[index, 1, data]] })
    @replaceState posts: posts

  render:->
    React.DOM.div
      className: 'content'
      React.createElement PostForm, addPost: @addPost
      React.DOM.div
        className: 'posts'
        React.DOM.h2
          className: 'title'
          'Posts'
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'content'
              React.DOM.th null, 'author'
              React.DOM.th null, 'Actions'

          React.DOM.tbody null,
            for post in @state.posts
              React.createElement Post, key: post.id, post: post, handleDelete: @deletePost, editPost: @editPost

