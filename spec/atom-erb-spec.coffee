# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomErb", ->
  [editor, editorElement, workspaceElement] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)

    waitsForPromise ->
      atom.workspace.open('test.erb')

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editorElement = atom.views.getView(editor)
      editor.setCursorBufferPosition([0,0])

    waitsForPromise ->
      atom.packages.activatePackage('atom-erb')

  describe "atom-erb", ->
    describe "activation", ->
      it "should be in the packages list", ->
        expect(atom.packages.loadedPackages["atom-erb"]).toBeDefined()

    describe "atom-erb:erb", ->
      beforeEach ->
        atom.commands.dispatch workspaceElement, "atom-erb:erb"

      it "inserts the ERB tag", ->
        expect(editor.getText()).toEqual "<%=  %>"

      it "moves the cursor inside the ERB tag", ->
        expect(editor.getCursorBufferPosition().toArray()).toEqual [0,4]
