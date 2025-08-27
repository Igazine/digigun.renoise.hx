package digigun.renoise;

import digigun.renoise.Document.Observable;
import lua.Table;

using digigun.renoise.Helper;

/**
 * Transport component of the Renoise song.
 * 
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.Transport.html
 */
@:native("renoise.Transport")
extern class Transport {
    /**
     * Playing
     */
    public var playing:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var playing_observable:Observable;

    /**
     * Transport sync mode. Note: `SyncMode.SYNC_MODE_JACK` only is available on Linux. Trying to enable it on other platforms will fire an error.
     */
    public var sync_mode:SyncMode;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var sync_mode_observable:Observable;

    /**
     * Old school speed or new LPB timing used? With `TimingModel.TIMING_MODEL_SPEED`, tpl is used as speed factor. The lpb property is unused then. With `TimingModel.TIMING_MODEL_LPB`, tpl is used as event rate for effects only and lpb defines relationship between pattern lines and beats.
     */
    public final timing_model:TimingModel;

    /**
     * Range: (32 - 999) Beats per Minute
     */
    public var bpm:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var bpm_observable:Observable;

    /**
     * Range: (1 - 256) Lines per Beat
     */
    public var lpb:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var lpb_observable:Observable;

    /**
     * Range: (1 - 16) Ticks per Line
     */
    public var tpl:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var tpl_observable:Observable;

    /**
     * Playback position
     */
    public var playback_pos:SongPos;

    /**
     * Range: (0 - song_end_beats) Song position in beats
     */
    public var playback_pos_beats:Float;

    /**
     * Edit position
     */
    public var edit_pos:SongPos;

    /**
     * Range: (0 - song_end_beats) Song position in beats
     */
    public var edit_pos_beats:Float;

    public final song_length:SongPos;

    public final song_length_beats:Float;

    public final loop_start:SongPos;

    public final loop_end:SongPos;

    @:native("loop_range")
    private final __loop_range:Table<Int, SongPos>;
    /**
     * {loop start, loop end}
     */
    public var loop_range(get, never):Array<SongPos>;
    private inline function get_loop_range():Array<SongPos> {
        return __loop_range.toArray();
    }

    /**
     * Range: (0 - song_end_beats)
     */
    public final loop_start_beats:Float;

    /**
     * Range: (0 - song_end_beats)
     */
    public final loop_end_beats:Float;

    @:native("loop_range_beats")
    private final __loop_range_beats:Table<Int, Float>;
    /**
     * {loop start beats, loop end beats}
     */
    public var loop_range_beats(get, never):Array<Float>;
    private inline function get_loop_range_beats():Array<Float> {
        return __loop_range_beats.toArray();
    }

    /**
     * 0 or Range: (1 - sequence length)
     */
    public final loop_sequence_start:UInt;

    /**
     * 0 or Range: (1 - sequence length)
     */
    public final loop_sequence_end:UInt;

    @:native("loop_sequence_range")
    private final __loop_sequence_range:Table<Int, UInt>;
    /**
     * {} or Range(sequence start, sequence end)
     */
    public var loop_sequence_range(get, never):Array<UInt>;
    private inline function get_loop_sequence_range():Array<UInt> {
        return __loop_sequence_range.toArray();
    }

    /**
     * Pattern Loop On/Off
     */
    public var loop_pattern:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var loop_pattern_observable:Observable;

    /**
     * Block Loop On/Off
     */
    public var loop_block_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var loop_block_enabled_observable:Observable;

    /**
     * Range: (2 - 16)
     */
    public var loop_block_range_coeff:UInt;

}

enum abstract PlayMode(Int) from Int to Int {
    var PLAYMODE_RESTART_PATTERN = 1;
    var PLAYMODE_CONTINUE_PATTERN = 2;
}

enum abstract RecordParameterMode(Int) from Int to Int {
    var RECORD_PARAMETER_MODE_PATTERN = 1;
    var RECORD_PARAMETER_MODE_AUTOMATION = 2;
}

enum abstract TimingModel(Int) from Int to Int {
    var TIMING_MODEL_SPEED = 1;
    var TIMING_MODEL_LPB = 2;
}

enum abstract SyncMode(Int) from Int to Int {
    var SYNC_MODE_INTERNAL = 1;
    var SYNC_MODE_MIDI_CLOCK = 2;
    var SYNC_MODE_ABLETON_LINK = 3;
    var SYNC_MODE_JACK = 4;
}