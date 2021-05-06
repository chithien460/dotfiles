# following placeholders are defined:  * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['gnome-terminal','--wait','--', 'nvim', '+call cursor({line}, {column})', '-f', '{file}']

# Bindings for normal mode
# config.unbind('d')
config.bind('<Ctrl-Tab>','tab-next')
config.bind('<Ctrl-Shift-Tab>','tab-prev')
