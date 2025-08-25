package digigun.renoise;

import haxe.ds.Either;
import digigun.renoise.Document.Observable;
import lua.Table;

using digigun.renoise.Helper;

/**
 * General remarks: Phrases do use renoise.PatternLine objects just like the pattern tracks do. When the instrument column is enabled and used, not instruments, but samples are addressed/triggered in phrases.
 */
@:native("renoise.InstrumentPhrase")
extern class InstrumentPhrase {
    static public final MAX_NUMBER_OF_LINES:UInt;
    static public final MIN_NUMBER_OF_NOTE_COLUMNS:UInt;
    static public final MAX_NUMBER_OF_NOTE_COLUMNS:UInt;
    static public final MIN_NUMBER_OF_EFFECT_COLUMNS:UInt;
    static public final MAX_NUMBER_OF_EFFECT_COLUMNS:UInt;

    /**
     * Name of the phrase as visible in the phrase editor and piano mappings.
     */
    public var name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var name_observable:Observable;

    /**
     * (Key)Mapping properties of the phrase or nil when no mapping is present.
     */
    public var mapping:InstrumentPhraseMapping;

    /**
     * playback mode
     */
    public var playback_mode:PlaybackMode;

    /**
     * Track changes to playback mode by attaching listener functions to it.
     */
    public var playback_mode_observable:Observable;

    /**
     * Phrase script properties. Only used when `playback_mode` is set to `InstrumentPhrase.PLAY_SCRIPT`
     */
    public final script:InstrumentPhraseScript;

    /**
     * Quickly check if a phrase has some non empty pattern lines.
     */
    public final is_empty:Bool;

    /**
     * Track changes to is_empty by attaching listener functions to it.
     */
    public var is_empty_observable:Observable;

    /**
     * Default: 16, Range: (1 - `InstrumentPhrase.MAX_NUMBER_OF_LINES`) Number of lines the phrase currently has.
     */
    public var number_of_lines:UInt;

    /**
     * Track changes to number_of_lines by attaching listener functions to it.
     */
    public var number_of_lines_observable:Observable;

    @:native("lines")
    private var __lines:Table<Int, PatternLine>;
    /**
     * Get all lines in a range [1, `number_of_lines_in_pattern`]
     */
    public var lines(get, never):Array<PatternLine>;
    private inline function get_lines():Array<PatternLine> {
        return __lines.toArray();
    }

    /**
     * Range: (`MIN_NUMBER_OF_NOTE_COLUMNS` - `MAX_NUMBER_OF_NOTE_COLUMNS`) How many note columns are visible in the phrase.
     */
    public var visible_note_columns:UInt;

    /**
     * Track changes to visible_note_columns by attaching listener functions to it.
     */
    public var visible_note_columns_observable:Observable;

    /**
     * Range: (MIN_NUMBER_OF_EFFECT_COLUMNS - MAX_NUMBER_OF_EFFECT_COLUMNS) How many effect columns are visible in the phrase.
     */
    public var visible_effect_columns:UInt;

    /**
     * Track changes to visible_effect_columns by attaching listener functions to it.
     */
    public var visible_effect_columns_observable:Observable;

    /**
     * Phrase's key-tracking mode.
     */
    public var key_tracking:KeyTrackingMode;

    /**
     * Track changes to key_tracking by attaching listener functions to it.
     */
    public var key_tracking_observable:Observable;

    /**
     * Range: (0 - 119) where C-4 is 48 Phrase's base-note. Only relevant when `key_tracking` is set to transpose.
     */
    public var base_note:UInt;

    /**
     * Track changes to base_note by attaching listener functions to it.
     */
    public var base_note_observable:Observable;

    /**
     * Loop mode. The phrase plays as one-shot when disabled.
     */
    public var looping:Bool;

    /**
     * Track changes to looping by attaching listener functions to it.
     */
    public var looping_observable:Observable;

    /**
     * Range: (1 - `number_of_lines`) Loop start. Playback will start from the beginning before entering loop
     */
    public var loop_start:UInt;

    /**
     * Track changes to loop_start by attaching listener functions to it.
     */
    public var loop_start_observable:Observable;

    /**
     * Range: (loop_start - `number_of_lines`) Loop end. Needs to be > loop_start and <= number_of_lines
     */
    public var loop_end:UInt;

    /**
     * Track changes to loop_end by attaching listener functions to it.
     */
    public var loop_end_observable:Observable;

    /**
     * Phrase autoseek settings
     */
    public var autoseek:Bool;

    /**
     * Track changes to autoseek by attaching listener functions to it.
     */
    public var autoseek_observable:Observable;

    /**
     * Range: (1 - 256) Phrase local lines per beat setting. New phrases get initialized with the song's current LPB setting. TPL can not be configured in phrases.
     */
    public var lpb:UInt;

    /**
     * Track changes to lpb by attaching listener functions to it.
     */
    public var lpb_observable:Observable;

    /**
     * Range: (0 - 1) Shuffle groove amount for a phrase. 0.0 = no shuffle (off), 1.0 = full shuffle
     */
    public var shuffle:Float;

    /**
     * Track changes to shuffle by attaching listener functions to it.
     */
    public var shuffle_observable:Observable;

    /**
     * Column visibility.
     */
    public var instrument_column_visible:Bool;

    /**
     * Track changes to instrument_column_visible by attaching listener functions to it.
     */
    public var instrument_column_visible_observable:Observable;

    public var volume_column_visible:Bool;

    /**
     * Track changes to volume_column_visible by attaching listener functions to it.
     */
    public var volume_column_visible_observable:Observable;

    public var panning_column_visible:Bool;

    /**
     * Track changes to panning_column_visible by attaching listener functions to it.
     */
    public var panning_column_visible_observable:Observable;

    public var delay_column_visible:Bool;

    /**
     * Track changes to delay_column_visible by attaching listener functions to it.
     */
    public var delay_column_visible_observable:Observable;

    public var sample_effects_column_visible:Bool;

    /**
     * Track changes to sample_effects_column_visible by attaching listener functions to it.
     */
    public var sample_effects_column_visible_observable:Observable;

    /**
     * Deletes all lines.
     */
    public function clear():Void;

    /**
     * Copy contents from another phrase.
     * @param phrase 
     */
    public function copy_from(phrase:InstrumentPhrase):Void;

    /**
     * Range: (1 - renoise.InstrumentPhrase.MAX_NUMBER_OF_LINES) Access to a single line by index. Line must be in Range: (1 - MAX_NUMBER_OF_LINES). This is a !lot! more efficient than calling the property: lines[index] to randomly access lines.
     * @param index 
     * @return PatternLine
     */
    public function line(index:UInt):PatternLine;

    @:native("lines_in_range")
    private function __lines_in_range(index_from:UInt, index_to:UInt):Table<Int, PatternLine>;
    /**
     * Get a specific line range
     * @param index_from 
     * @param index_to 
     * @return Array<PatternLine>
     */
    public inline function lines_in_range(index_from:UInt, index_to:UInt):Array<PatternLine> {
        return __lines_in_range(index_from, index_to).toArray();
    }

    //TODO has_line_notifier()
    //TODO add_line_notifier()
    //TODO remove_line_notifier()
    //TODO has_line_edited_notifier()
    //TODO add_line_edited_notifier()
    //TODO remove_line_edited_notifier()

    /**
     * Note column mute states.
     * @param column 
     * @return Bool
     */
    public function column_is_muted(column:UInt):Bool;

    public function column_is_muted_observable(column:UInt):Observable;

    public function set_column_is_muted(column:UInt, muted:Bool):Void;

    /**
     * Note column names.
     * @param column 
     * @return String
     */
    public function column_name(column:UInt):String;

    public function column_name_observable(column:UInt):Observable;

    public function set_column_name(column:UInt, name:String):Void;

    /**
     * Swap the positions of two note columns within a phrase.
     * @param index1 
     * @param index2 
     */
    public function swap_note_columns_at(index1:UInt, index2:UInt):Void;

    /**
     * Swap the positions of two effect columns within a phrase.
     * @param index1 
     * @param index2 
     */
    public function swap_effect_columns_at(index1:UInt, index2:UInt):Void;

}

enum abstract KeyTrackingMode(Int) from Int to Int {
    var KEY_TRACKING_NONE = 1;
    var KEY_TRACKING_TRANSPOSE = 2;
    var KEY_TRACKING_OFFSET = 3;
}

enum abstract PlaybackMode(Int) from Int to Int {
    var PLAY_PATTERN = 1;
    var PLAY_SCRIPT = 2;
}

typedef PhraseLinePosition = {
    line:UInt,
}

// TODO PhraseLineChangeCallbackWithContext
