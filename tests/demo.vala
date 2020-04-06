/* -*- Mode: Vala; indent-tabs-mode: nil; c-basic-offset: 4; tab-width: 4 -*- */
/* vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab : */
/*
 * demo.vala
 *
 * Test CircularProgressBar visually.
 * Tweak some settings/properties and check the results.
 *
 * José Miguel Fonte
 */

using CircularProgressWidgets;

private static string convert_color_component_to_string (double color_component) {
    return "%.2x".printf ((uint) (color_component * 255));
}

private static string convert_rgba_to_webcolor (Gdk.RGBA c) {
    var red   = convert_color_component_to_string (c.red);
    var green = convert_color_component_to_string (c.green);
    var blue  = convert_color_component_to_string (c.blue);

    return "#" + red + green + blue;
}

public static int main (string[] args) {
    Gtk.init (ref args);

    var pbar    = new CircularProgressBar ();
    pbar.margin = 6;

    var builder = new Gtk.Builder.from_file ("menu.glade");
    var window  = builder.get_object ("window1") as Gtk.Window; 
    var viewp   = builder.get_object ("viewport1") as Gtk.Viewport;
    var s_progr = builder.get_object ("scale1") as Gtk.Scale;    
    var s_linew = builder.get_object ("scale2") as Gtk.Scale;    

    var colorb1 = builder.get_object ("colorbutton1") as Gtk.ColorButton;
    var colorb2 = builder.get_object ("colorbutton2") as Gtk.ColorButton;
    var colorb3 = builder.get_object ("colorbutton3") as Gtk.ColorButton;

    var button_cap           = builder.get_object ("togglebutton3") as Gtk.ToggleButton;
    var button_center_filled = builder.get_object ("togglebutton1") as Gtk.ToggleButton;
    var button_radius_filled = builder.get_object ("togglebutton2") as Gtk.ToggleButton;

    button_center_filled.bind_property ("active", pbar, "center_filled", BindingFlags.DEFAULT);
    button_radius_filled.bind_property ("active", pbar, "radius_filled", BindingFlags.DEFAULT);

    var pbar_w = builder.get_object ("width") as Gtk.Label;
    var pbar_h = builder.get_object ("height") as Gtk.Label;
    pbar_w.set_use_markup (true);
    pbar_h.set_use_markup (true);

    var linew_adj = builder.get_object ("adjustment2") as Gtk.Adjustment;

    viewp.add (pbar);

    // Set default tooltips
    // Color representation mismatch on default and after change. FIXME!
    button_cap.set_tooltip_text (pbar.line_cap.to_string ());
    colorb1.set_tooltip_text (pbar.center_fill_color);
    colorb2.set_tooltip_text (pbar.radius_fill_color);
    colorb3.set_tooltip_text (pbar.progress_fill_color);

    var color = Gdk.RGBA();

    color.parse (pbar.center_fill_color);
    colorb1.set_rgba (color);

    color.parse (pbar.radius_fill_color);
    colorb2.set_rgba (color);

    color.parse (pbar.progress_fill_color);
    colorb3.set_rgba (color);

    colorb1.color_set.connect (() => {
        var c = colorb1.get_rgba ();
        pbar.center_fill_color = c.to_string ();
        colorb1.set_tooltip_text (convert_rgba_to_webcolor (c));
    });

    colorb2.color_set.connect ((new_color) => {
        var c = colorb2.get_rgba ();
        pbar.radius_fill_color = c.to_string ();
        colorb2.set_tooltip_text (convert_rgba_to_webcolor (c));
    });

    colorb3.color_set.connect ((new_color) => {
        var c = colorb3.get_rgba ();
        pbar.progress_fill_color = c.to_string ();
        colorb3.set_tooltip_text (convert_rgba_to_webcolor (c));
    });

    button_cap.toggled.connect (() => {
        if (pbar.line_cap == Cairo.LineCap.ROUND) {
            pbar.line_cap =  Cairo.LineCap.BUTT;
        } else {
            pbar.line_cap =  Cairo.LineCap.ROUND;
        }

        button_cap.set_tooltip_text (pbar.line_cap.to_string ());
    });

    s_progr.value_changed.connect (() => {
        pbar.percentage = s_progr.get_value ();
    });

    s_linew.value_changed.connect (() => {
        pbar.line_width = ((int) s_linew.get_value ());
    });

    window.configure_event.connect ((event) => {
        var w = pbar.get_allocated_width ();
        var h = pbar.get_allocated_height ();

        var wstr = "%d".printf (w);
        var hstr = "%d".printf (h);

        // The lowest is the indicator of the size
        // because the widget keeps the aspect ratio

        if (w > h) {
            hstr = "<b><u>" + hstr + "</u></b>";
        } else if (h > w) {
            wstr = "<b><u>" + wstr + "</u></b>";
        } else {
            wstr = "<b><u>" + wstr + "</u></b>";
            hstr = "<b><u>" + hstr + "</u></b>";
        }

        pbar_w.set_markup (wstr);
        pbar_h.set_markup (hstr);

        linew_adj.set_upper ((double) int.min (w, h) / 2);

        return false;
    });

    window.destroy.connect (() => {
        Gtk.main_quit ();
    });

    window.show_all ();

    Gtk.main ();

    return 0;
}
