# Nvchad Docs - [Link](https://nvchad.com/docs/quickstart/install)

## Cleaning up previous nvim configs

````bash
mv ~/.config/nvim ~/.config/nvim.bak
````

* Backup any old nvim imp configs

````bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
````

* Removes all old neovim configs

---

## Installing Nvchad

````
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
````

---

### Post Installation



* Nvchand will ask if you want to install the example config - **NO**
* Then it will **install all the plugins**

1. **Change Theme in Nvchad**
   

* Space + th

2. **Install Syntax highlighting for a language**
   

````nvim command
:TSInstall python
````

* Check which syntaxes are installed using the `TSInstallInfo` command.

3. **File Tree**
   `Ctrl + n`
   

* Mark any files in the file tree using the *m* key on the file.
* Create a new file using the `a` key.
* Copy files using the `c` and `p` keys.
* Rename files using the `r` key.
* Delete files using the `d` key.

4. **File Navigation**

* Find files using the `Space + f + f` keys.
  
* Navigate files only in the open buffers using `Space + f + b`.

5. **Nvchad Cheatsheet command**

* `Space + ch`
  

6. **Nvchad Window Navigation**

* You can split windows using:
  * Horizontal split: :sp
  * Vertical split: ":vsp
* Select Right/Left: `Ctrl + l`, `Ctrl + h`
* Select Up/Down: `Ctrl + j`, `Ctrl + k`

7. **Nvchad Buffers**

* Navigate through all open buffers: TAB (backward: Shift + TAB)
* Close a buffer: `Space + x`

8. Nvchad Customization
   

## Change Values of "", {}, \[\] Fast

1. Delete inside quotes: `di"`
1. Delete including the quotation marks: `da"`
1. Delete inside parentheses: `di+symbol`
1. Copy inside quotes: `yi"`

## Delete Command

1. Delete the entire document: `dG`
1. Delete the entire document from the end of the document: `dgg`

## File Navigation

1. Go to the start of the file: `gg`
1. Go to the end of the file: `G`
1. Go to:
   1. High: `H` of the page
   1. Mid: `M` of the page
   1. Lower: `L` of the page
1. Cursor:
   1. Up: `Ctrl + u`
   1. Down: `Ctrl + d`

## Text Customization

1. Capitalize a character: `Shift + ~`
1. Increment a number: `Ctrl + a`
1. Decrement a number: `Ctrl + x`

## Insert Mode Shortcuts

1. Delete word fast: `Ctrl + w`
1. Delete Line: `Ctrl + u`

## Indentation

1. Quickly insert into the intended block right after a condition: `S` key instead of `i` - it can also delete the entire line and switch into insert mode
1. Indent the whole file: `gg=G`
1. `Ctrl + i`: performs indentation in insert mode

## Vim's Built-in Spell Check

1. `:set spell`: Turn on spell check
1. Turn off spell check:
   1. `:set nospell`
   1. `:set spell&`
   1. `:set spell!`

## Vim's Help Menu

1. `:help`: Open Vim's help menu
1. Get help on certain keys: `:h [key]`, e.g., `:h d` gets help on the delete command `d`
1. Quit out of the help menu: `Ctrl + wq` (write and quit)

## Vim's Quick ESC

1. `Ctrl + c`: Serves the exact same function as the ESC key but you don't have to move your hands to execute.
1. `Ctrl + o`: Same as the ESC function

## Vim's Find Function

1. `f{character}`: Pressing f and then a character finds the next instance of the character in that line.
1. `F{character}`: Pressing F and then a character finds the previous instance of the character in that line.
1. `df{character}`: Deletes everything from the cursor to the first opening character it finds.
1. `t{character}`: Pressing t and then a character finds the next instance of the character in that line but stops before reaching the character.
1. `tf{character}`: Deletes everything from the cursor to the first opening character it finds but stops before reaching the character.

Say you want to delete lines 6 through 14 in a document. In normal mode, type: `:6, 14d`, and press enter. The lines will be deleted "in place" without having to use `dd` on each line.

* `vab`: Selects content within parentheses () along with it.
* `vib`: Selects only the content within parentheses.
* `vaB`: For {} vib - for {}.
* `%`: Jumps between matching brackets, tags, or anything.
* `D`: Deletes from the cursor position to the end of the line.
* `Y`: Copies till the end of the line.
* `xp`: Swaps letters like , bnigo --> bingo.
* `gj`: Helps to go down when a line is wrapped.
* `gv`: Selects the previously selected part in visual mode.
* `gf`: Jumps to the file when on the file path. For web developers, `cit` will jump into the tag. `vit` will jump into the tag in visual mode.

To highlight and insert hash symbols at the beginning of consecutive lines (or the hash can be any word/letter):

* `Ctrl + v, j, j, j, j, I, #, Esc`

* Likewise, to delete: `Ctrl + v, j, j, j, j, x`

* `dap`: Delete a paragraph.

* `O`: Open insert mode on the line above.

* Search for the word under the cursor: `#`.

* Reverse search for the word under the cursor: `g, go to last change`.

* Go to next match: `n`.

* Scroll back to the previous match: `Shift + n`.

`:wq!` should be `ZZ`.

* `ZQ`: Quit without saving (normal mode).

Use `:x` instead of `:wq` to write and quit Vim.

## [Neovide](https://neovide.dev/)



1. change LARGE font to small font in neovide
1. Paste the below line in the **init.lua file** ~/.config/lua/custom/init.lua
1. 
   * also don't forget to add  `M.init = 'custom.init'` in the chardrc. file

````nvim
vim.cmd(":set guifont=iosevka:h10")
````

## VIM Basics

[Link](https://vim.fandom.com/wiki/Vim_Tips_Wiki)

1. Move Cursor
   
   * `h` - move cursor left
   * `j` - move cursor down
   * `k` - move cursor up
   * `l` - move cursor right
1. Save and Quit
   
   * `:w` - save the file
   * `:q` - quit vim
   * `:wq` - save and quit
   * `:q!` - quit without saving
     noice
1. Editing Text
   
   * `i` - enter insert mode
   * `A` - enter insert mode at the end of the line
   * `x` - delete character under cursor
   * `dd` - delete current line
   * `yy` - copy current line
   * `p` - paste copied/deleted text
   * `u` - undo last change
   * use `:split` to get a preview window of all the changes
   * `Ctrl + r` - redo last change
1. Search and Replace
   
   * `/pattern` - search for pattern
   * `n` - go to next search result
   * `N` - go to previous search result
   * `:%s/old/new/g` - replace all occurrences of "old" with "new"
   * You can `*` in a word, and then `:%s//replacement` will replace that word for `replacement`
1. Visual Mode
   
   * `v` - enter visual mode
   * `V` - enter visual line mode
   * `Ctrl + v` - enter visual block mode
   * `y` - yank (copy) selected text
   * `d` - delete selected text
   * `>` - indent selected lines
   * `<` - unindent selected lines
