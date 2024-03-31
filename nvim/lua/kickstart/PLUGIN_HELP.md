# Plugins

## Setup

Plugins can be added with a link (or for a github repo: `'owner/repo'`
link).

```lua
'tpope/vim-sleuth',
```

Plugins can also be added by using a table, with the first argument being
the link and the following keys can be used to configure plugin
behavior/loading/etc. Use `opts = {}` to force a plugin to be loaded.

```lua
{ 'numToStr/Comment.nvim', opts = {} },
```

This is equivalent to:

```lua
require('Comment').setup({})
```

Here is a more advanced example where we pass configuration options to `gitsigns.nvim`. This is equivalent to the following Lua:

```lua
require('gitsigns').setup({ ... })
```

```lua
{
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
},
```

Plugins can also be configured to run Lua code when they are loaded.

This is often very useful to both group configuration, as well as handle lazy loading plugins that don't need to be loaded immediately at startup.

For example, in the following configuration, we use:

```lua
event = 'VimEnter'
```

which loads which-key before all the UI elements are loaded. Events can be normal autocommands events (`:help autocmd-events`).

Then, because we use the `config` key, the configuration only runs after the plugin has been loaded:

```lua
 config = function() ... end
```

Plugins can specify dependencies.

The dependencies are proper plugin specifications as well - anything you do for a plugin at the top level, you can do for a dependency.

Use the `dependencies` key to specify the dependencies of a particular plugin
