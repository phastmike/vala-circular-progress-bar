# CircularProgressBar
A Circular progress bar Gtk.Widget, implemented in **Vala**. At the moment, only renders percentage. Main goal was to implement a simple circular progress bar for a UI Dashboard.

![Visual examples](/cpb-splash.png "Some visual examples")

## Properties
- Font
- Percentage
- Progress line width
- Toggle center fill
- Line Cap (as in Cairo.LineCap)
- Fill colors (Center, Radius and Progress)
- Toggle fullscale progress (with different fill color)

## Requirements
This widget should build and run on systems with:
- Gtk+ >= 3.18
- Valac >= 0.30

Probably it will work with previous minor versions.

## Building and running
Clone this repository:

`$ git clone https://github.com/phastmike/vala-circular-progress-bar`

then cd into it and run `make`

    $ cd vala-circular-progress-bar
    $ make

After building you can run a simple demo program on the tests folder by typing:

	$ ./tests/test1.vala
    
#### Demo

The demo application allows you to tweak some of the properties in order the have a quick visual feedback of the applied values. The horizontal scales control the progress bar percentage evolution and the width, in pixels, of the progress bar sement. The buttons bellow the scales, toggle the line cap, center filling (on/off) and progress bar fully filled (on/off).

## Future work

Although the use of the widget is somehow controlled or static, some improvements could be made if some dynamic behaviour is needed, will list them as a ToDo list:

- [ ] improve resizing and properties relation
- [ ] dynamic text resizing
- [ ] define progress units (hardcoded atm as percentage)
- [ ] add color/font selection to the demo application
