/* -*- Mode: Vala; indent-tabs-mode: nil; c-basic-offset: 4; tab-width: 4 -*- */
/* vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab : */
/*
 * demo.vala
 *
 * Test CircularProgressBar visually. Tweak some settings/properties and check the results.
 * Could add color selection for fills.
 *
 * José Miguel Fonte
 */

using CircularProgressWidgets;

public static int main (string[] args) {
    Gtk.init (ref args);

    var window  = new Gtk.Window ();
    var pbar    = new CircularProgressBar ();
    var mainbox = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
    var s_progr = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 0.0, 1.0, 0.01);
    var s_linew = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 1.0, 100.0, 1.0);

    var buttonbox               = new Gtk.ButtonBox (Gtk.Orientation.VERTICAL);
    var button_cap              = new Gtk.ToggleButton.with_label (pbar.line_cap.to_string ());
    var button_center_filled    = new Gtk.ToggleButton.with_label ("Center Filled");
    var button_radius_filled    = new Gtk.ToggleButton.with_label ("Radius Filled");

    mainbox.pack_start (pbar, true, true, 0);
    mainbox.pack_end (buttonbox, false, false, 6);
    mainbox.pack_end (s_linew, false, false, 6);
    mainbox.pack_end (s_progr, false, false, 6);

    buttonbox.pack_end (button_cap, false, false, 6);
    buttonbox.pack_start (button_center_filled, false, false, 6);
    buttonbox.pack_end (button_radius_filled, false, false, 6);

    pbar.margin = 6;
    s_progr.margin = 6;
    s_linew.margin = 6;
    buttonbox.margin = 6;

    window.add (mainbox);
    window.show_all ();

    button_cap.toggled.connect (() => {
        if (pbar.line_cap == Cairo.LineCap.ROUND) {
            pbar.line_cap =  Cairo.LineCap.BUTT;
        } else {
            pbar.line_cap =  Cairo.LineCap.ROUND;
        }

        button_cap.set_label (pbar.line_cap.to_string ());
    });

    button_center_filled.toggled.connect (() => {
        pbar.center_filled = !pbar.center_filled;
    });

    button_radius_filled.toggled.connect (() => {
        pbar.radius_filled = !pbar.radius_filled;
    });

    s_progr.value_changed.connect (() => {
        pbar.percentage = s_progr.get_value ();
    });

    s_linew.value_changed.connect (() => {
        pbar.line_width = ((int) s_linew.get_value ());
    });

    window.destroy.connect (() => {
        Gtk.main_quit ();
    });

    Gtk.main ();

    return 0;
}
