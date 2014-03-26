{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomErb", ->
  [activationPromise, editor, editorView] = []

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspaceView.openSync()
    editorView = atom.workspaceView.getActiveView()
    editor = editorView.getEditor()

    activationPromise = atom.packages.activatePackage('atom-erb')

  describe "atom-erb:erb command", ->
    beforeEach ->
      runs ->
        editor.setText ""
        editor.setCursorBufferPosition([0, 0])
        editorView.trigger('atom-erb:erb')

    it "inserts the ERB tag", ->
      expect(editor.getText()).toBe "<%=  %>"

    it "moves the cursor into the ERB tag", ->
      expect(editor.getCursorBufferPosition().toArray()).toBe [0, 4]
