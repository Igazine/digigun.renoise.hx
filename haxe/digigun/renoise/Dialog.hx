package digigun.renoise;

/**
 * A custom dialog created via the scripting API. Dialogs can be created via `renoise.app().showCustomDialog`.
 * 
 * See create custom views on top of the `renoise.ViewBuilder` docs on how to create views for the dialog.
 */
@:native("Dialog")
extern class Dialog {
    /**
     * Check if a dialog is alive and visible.
     */
    public final visible:Bool;

    /**
     * Check if a dialog is visible and is the key window.
     */
    public final focused:Bool;

    /**
     * Bring an already visible dialog to front and make it the key window.
     */
    public function show():Void;

    /**
     * Close a visible dialog.
     */
    public function close():Void;
}