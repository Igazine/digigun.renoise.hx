package digigun.renoise;

import digigun.renoise.Document.Observable;
import digigun.renoise.InstrumentPhrase.KeyTrackingMode;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.InstrumentPhraseMapping")
extern class InstrumentPhraseMapping {
    /**
     * Linked phrase.
     */
    public var phrase:InstrumentPhrase;

    /**
     * Phrase's key-tracking mode.
     */
    public var key_tracking:KeyTrackingMode;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var key_tracking_observable:Observable;

    /**
     * Range: (0 - 119) where C-4 is 48
     */
    public var base_note:UInt;

    /**
     * Track changes to base_note by attaching listener functions to it.
     */
    public var base_note_observable:Observable;

    @:native("note_range")
    private var __note_range:Table<Int, UInt>;
    /**
     * Range: (0 - 119) where C-4 is 48
     */
    public var note_range(get, set):Array<UInt>;
    private inline function get_note_range():Array<UInt> {
        return __note_range.toArray();
    }
    private inline function set_note_range(value:Array<UInt>):Array<UInt> {
        __note_range = value.toTable();
        return value;
    }

    /**
     * Track changes to note_range by attaching listener functions to it.
     */
    public var note_range_observable:Observable;

    /**
     * Loop mode. The phrase plays as one-shot when disabled.
     */
    public var looping:Bool;

    /**
     * Track changes to looping by attaching listener functions to it.
     */
    public var looping_observable:Observable;

    public var loop_start:UInt;

    /**
     * Track changes to loop_start by attaching listener functions to it.
     */
    public var loop_start_observable:Observable;

    public var loop_end:UInt;

    /**
     * Track changes to loop_end by attaching listener functions to it.
     */
    public var loop_end_observable:Observable;
}
