## Extend/Inherit highlight groups
```vim
MkHighlightInheriting({String},   {Dict},    {String})
MkHighlightInheriting(new_name, options_dict, inherit)
```
Creates/Overrides `highlight` groups `new_name` from `inherit` adding/overwriting options in `options_dict`.

##### Example usage
`:call MkHighlightInheriting("Conditional", {'gui':'bold,italic'}, "Conditional")`
Makes conditionals bold and italic, while leaving color unchanged.

#### Helper functions
```vim
GetHighlightOpts({String})
GetHighlightOpts(group)
```
Returns a dictionary of options associated with highlight group named {String}.
E.g.: `{'gui': 'italic,bold', 'ctermfg': '11'}
note: this function will recurse down highlight links.
A recursive version of [vi.stackexchange.com/a/12305](https://vi.stackexchange.com/a/12305)

`SynGroups()`
echomsgs `highlight` groups and `links` under cursor.
" Amalgamated from answers on [stackoverflow](https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim)


