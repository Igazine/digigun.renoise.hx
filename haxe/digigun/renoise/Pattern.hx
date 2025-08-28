package digigun.renoise;

import lua.Table;
import digigun.renoise.Document.Observable;

using digigun.renoise.Helper;

@:native("renoise.Pattern")
extern class Pattern {
    /**
     * Quickly check if any track in a pattern has some non empty pattern lines. This does not look at track automation.
     */
    public var is_empty:Bool;

    /**
     * Name of the pattern, as visible in the pattern sequencer.
     */
    public var name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var name_observable:Observable;

    /**
     * Number of lines the pattern currently has. 64 by default. Max is renoise.Pattern.MAX_NUMBER_OF_LINES, min is 1.
     */
    public var number_of_lines:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var number_of_lines_observable:Observable;

    @:native("tracks")
    private var __tracks:Table<Int, PatternTrack>;
    /**
     * READ-ONLY Access to the pattern tracks. Each pattern has #renoise.song().tracks amount of tracks.
     */
    public var tracks(get, never):Array<PatternTrack>;
    private inline function get_tracks():Array<PatternTrack> {
        return __tracks.toArray();
    }

    /**
     * Deletes all lines & automation.
     */
    public function clear():Void;

    public function copy_from(other:Pattern):Void;

    public function track(index:Int):PatternTrack;

    /**
     * Check/add/remove notifier functions or methods, which are called by Renoise as soon as any of the pattern's lines have changed. The notifiers are called as soon as a new line is added, an existing line is cleared, or existing lines are somehow changed (notes, effects, anything)
     * 
     * A single argument is passed to the notifier function: "pos", a table with the fields "pattern", "track" and "line", which defines where the change has happened.
     * 
     * Example
     * ```
     * function my_pattern_line_notifier(pos)
     * -- check pos.pattern, pos.track, pos.line (all are indices)
     * end
     * ```
     * Please be gentle with these notifiers, don't do too much stuff in there. Ideally just set a flag like "pattern_dirty" which then gets picked up by an app_idle notifier: The danger here is that line change notifiers can be called hundreds of times when, for example, simply clearing a pattern.
     * 
     * If you are only interested in changes that are made to the currently edited pattern, dynamically attach and detach to the selected pattern's line notifiers by listening to "renoise.song().selected_pattern_observable".
     * 
     * @param func 
     * @param obj 
     * @return Bool
     */
    public function has_line_notifier(func:PatternLineChangeCallbackWithContext, obj:Dynamic):Bool;

    public function add_line_notifier(func:PatternLineChangeCallbackWithContext, obj:Dynamic):Void;

    public function remove_line_notifier(func:PatternLineChangeCallbackWithContext, obj:Dynamic):Void;

    public function has_line_edited_notifier(func:PatternLineChangeCallbackWithContext, obj:Dynamic):Bool;

    public function add_line_edited_notifier(func:PatternLineChangeCallbackWithContext, obj:Dynamic):Void;

    public function remove_line_edited_notifier(func:PatternLineChangeCallbackWithContext, obj:Dynamic):Void;
}

typedef PatternLinePosition = {
    pattern:UInt,
    track:UInt,
    line:UInt
}

typedef PatternLineChangeCallbackWithContext = (Dynamic, PatternLinePosition)->Void;
