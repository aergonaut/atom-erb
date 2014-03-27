{WorkspaceView} = require 'atom'
AtomErb = require "../lib/atom-erb"

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomErb", ->
  [editor, editorView, atomErb] = []

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model
    atom.workspaceView.openSync('test.erb')
    editorView = atom.workspaceView.getActiveView()
    {editor} = editorView
    atomErb = AtomErb.activate()
    editor.setCursorBufferPosition([0,0])

  describe "atom-erb:erb", ->
    beforeEach ->
      editorView.trigger "atom-erb:erb"

    it "inserts the ERB tag", ->
      expect(editor.getText()).toEqual "<%=  %>"

    it "moves the cursor inside the ERB tag", ->
      expect(editor.getCursorBufferPosition().toArray()).toEqual [0,4]
