module.exports =
  activate: (state) ->
    atom.workspaceView.command "atom-erb:erb", => @erb()

  erb: ->
    editor = atom.workspaceView.getActiveView().getEditor()
    editor.insertText("<%=  %>")
    [curr_r, curr_c] = editor.getCursorBufferPosition().toArray()
    editor.setCursorBufferPosition([curr_r, curr_c - 3])
