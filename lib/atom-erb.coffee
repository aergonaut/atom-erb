module.exports =
  activate: (state) ->
    atom.commands.add "atom-workspace",
      "atom-erb:erb": => @erb()

  erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText("<%=  %>")
    [curr_r, curr_c] = editor.getCursorBufferPosition().toArray()
    editor.setCursorBufferPosition([curr_r, curr_c - 3])
