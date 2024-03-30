# archlinux configuration

## Keyboard

To remap Caps Lock to Esc in the TTY

- Copy personal.en.map to /usr/local/share/kbd/keymaps
- Update /etc/vconsole.conf and add/replace `KEYMAP` to:

```markdown
KEYMAP=/usr/local/share/kbd/keymaps/personal.en.map
```
