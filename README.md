[![Build Status](https://app.travis-ci.com/phastmike/vala-circular-progress-bar.svg?branch=master)](https://app.travis-ci.com/github/phastmike/vala-circular-progress-bar)

# CircularProgressBar
A Circular progress bar Gtk.Widget, implemented in **Vala**. Main goal was to implement a simple circular progress bar for a UI Dashboard.

It now supports Gtk4 and the previous version targeted Gtk3 and now resides in the `gtk3` branch.

![Visual examples](/cpb-splash.png "Some visual examples")

## Properties
- Font
- Percentage
- Progress line width
- Toggle center fill
- Line Cap (as in Cairo.LineCap)
- Fill colors (Center, Radius and Progress)
- Toggle fullscale progress (with different fill color)

### Notes regarding Line width

When setting `line_width` as zero, the progress will be rendered as a pie, fully filled and radius fill will be ignored.

## Requirements
This widget should build and run on systems with:
- Gtk+ >= 3.18
- Valac >= 0.30

Probably it will work with previous minor versions.

## Use
To use this widget you will only need to copy the file `circular-progress-bar.vala` onto your project and include it in your build system. The class is defined on the `CircularProgressWidgets` namespace and you can check it's use on the file `demo.vala` included on the tests folder in this repository.

The following build instructions are used to build the demo.

## Building and running
Clone this repository:

	$ git clone https://github.com/phastmike/vala-circular-progress-bar

then cd into it and run `make`:

	$ cd vala-circular-progress-bar/tests
	$ make

After building you can run the demo program in the tests folder by typing:

	$ ./demo
    
#### Demo

The demo/test application allows you to tweak some of the properties in order the have a quick visual feedback of the applied values. The horizontal scales control the progress bar percentage evolution and the width, in pixels, of the progress bar segment. The buttons bellow the scales, toggle the line cap, center filling (on/off) and progress bar as fully filled (on/off).

## Future work

Although the use of the widget is somehow controlled or static, some improvements could be made if some dynamic behaviour is needed, will list them as a ToDo list:

- [ ] improve resizing and properties relation
- [x] ~~add color selection to the demo application~~
- [ ] add font selection to the demo application

## Applications using this circular progress bar
- Elementary OS applet: [date-countdown](https://github.com/rickybas/date-countdown)
- Elementary OS app: [Optimizer](https://github.com/hannesschulze/optimizer) (based on)
- Elementary OS app: [Planner](https://github.com/alainm23/planner) (project progress)
