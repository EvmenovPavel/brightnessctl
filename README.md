# brightnessctl
This shell project is designed to allow change of the
*/sys/class/backlight/&#42;/brightness* without being root.
This is usefull for keybinding.

## Configuration
```bash
brightFolder="/sys/class/backlight/intel_backlight/"
```

## Installation

	$ sudo make install

## Make sudo not ask for a password

	$ sudo visudo

	%wheel ALL=(root) NOPASSWD: /usr/local/bin/brightness

## Testing

	sudo brightness +10
	sudo brightness -10

	$ sudo brightness status
	> current_bright: 255
	> max_bright: 255
	> min_bright: 12

## Key binding (AwesomeWM)
```bash
-- Brightness
	awful.key({}, key.brightness.XF86MonBrightnessUp,
		function()
			awful.spawn("sudo brightness +25", false)
		end,
	{ description = "Brightness +25%", group = "hotkeys" }),
    
	awful.key({}, key.brightness.XF86MonBrightnessDown,
		function()
			awful.spawn("sudo brightness -25", false)
		end,
	{ description = "Brightness -25%", group = "hotkeys" }),
```
