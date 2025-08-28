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

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var loop_block_range_coeff_observable:Observable;

    /**
     * Start of block loop
     */
    public var loop_block_start_pos:SongPos;

    /**
     * Pattern edit/record mode On/Off
     */
    public var edit_mode:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var edit_mode_observable:Observable;

    /**
     * Range: (0 - 64)
     */
    public var edit_step:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var edit_step_observable:Observable;

    /**
     * Range: (0 - 8)
     */
    public var octave:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var octave_observable:Observable;

    /**
     * Enabled for MIDI keyboards
     */
    public var octave_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var octave_enabled_observable:Observable;

    /**
     * Metronome playback On/Off
     */
    public var metronome_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var metronome_enabled_observable:Observable;

    /**
     * Range: (1 - 16) or 0 = guess from pattern length
     */
    public var metronome_beats_per_bar:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var metronome_beats_per_bar_observable:Observable;

    /**
     * Range: (1 - 256) or 0 = songs current LPB
     */
    public var metronome_lines_per_beat:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var metronome_lines_per_beat_observable:Observable;

    /**
     * Metronome precount playback On/Off
     */
    public var metronome_precount_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var metronome_precount_enabled_observable:Observable;

    /**
     * Range: (1 - 4)
     */
    public var metronome_precount_bars:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var metronome_precount_bars_observable:Observable;

    /**
     * Range: (0 - math.db2lin(6))
     */
    public var metronome_volume:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var metronome_volume_observable:Observable;

    /**
     * Record note quantization On/Off
     */
    public var record_quantize_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var record_quantize_enabled_observable:Observable;

    /**
     * Range: (1 - 32)
     */
    public var record_quantize_lines:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var record_quantize_lines_observable:Observable;

    /**
     * Record parameter
     */
    public var record_parameter_mode:RecordParameterMode;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var record_parameter_mode_observable:Observable;

    /**
     * Follow, wrapped pattern, single track modes
     */
    public var follow_player:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var follow_player_observable:Observable;

    public var wrapped_pattern_edit:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var wrapped_pattern_edit_observable:Observable;

    public var single_track_edit_mode:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var single_track_edit_mode_observable:Observable;

    /**
     * Groove (aka Shuffle)
     */
    public var groove_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var groove_enabled_observable:Observable;

    @:native("groove_amounts")
    private var __groove_amounts:Table<Int, Float>;
    /**
     * table with 4 numbers in Range: (0 - 1)
     */
    public var groove_amounts(get, set):Array<Float>;
    private inline function get_groove_amounts():Array<Float> {
        return this.__groove_amounts.toArray();
    }
    private inline function set_groove_amounts(value:Array<Float>):Array<Float> {
        this.__groove_amounts = Table.fromArray(value);
        return value;
    }

    /**
     * Will be called as soon as any groove value changed.
     */
    public var groove_assignment_observable:Observable;

    /**
     * Global Track Headroom To convert to dB: `dB = math.lin2db(renoise.Transport.track_headroom)` To convert from dB: `Transport.track_headroom = math.db2lin(dB)` Range: (math.db2lin(-12) - math.db2lin(0))
     */
    public var track_headroom:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var track_headroom_observable:Observable;

    /**
     * Computer Keyboard Velocity.
     */
    public var keyboard_velocity_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var keyboard_velocity_enabled_observable:Observable;

    /**
     * Will return the default value of 127 when keyboard_velocity_enabled == false. Range: (0 - 127)
     */
    public var keyboard_velocity:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var keyboard_velocity_observable:Observable;

    /**
     * true when sample sample dialog is visible and recording started.
     */
    public final sample_recording:Bool;

    /**
     * Sample recording pattern quantization On/Off.
     */
    public var sample_recording_sync_enabled:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var sample_recording_sync_enabled_observable:Observable;

    /**
     * Panic
     */
    public function panic():Void;

    /**
     * Start playing in song or pattern mode.
     * @param mode 
     */
    public function start(mode:PlayMode):Void;

    /**
     * Start playing the currently edited pattern at the given line offset
     * @param line 
     */
    @:overload(function(song_pos:SongPos):Void {})
    public function start_at(line:UInt):Void;

    /**
     * Stop playing. When already stopped this just stops all playing notes.
     */
    public function stop():Void;

    /**
     * Immediately start playing at the given sequence position.
     * @param sequence_pos 
     */
    public function trigger_sequence(sequence_pos:UInt):Void;

    /**
     * Append the sequence to the scheduled sequence list. Scheduled playback positions will apply as soon as the currently playing pattern play to end.
     * @param sequence_pos 
     */
    public function add_scheduled_sequence(sequence_pos:UInt):Void;

    /**
     * Replace the scheduled sequence list with the given sequence.
     * @param sequence_pos 
     */
    public function set_scheduled_sequence(sequence_pos:UInt):Void;

    /**
     * Move the block loop one segment forwards, when possible.
     */
    public function loop_block_move_forwards():Void;

    /**
     * Move the block loop one segment backwards, when possible.
     */
    public function loop_block_move_backwards():Void;

    /**
     * Start a new sample recording when the sample dialog is visible.
     */
    public function start_sample_recording():Void;

    /**
     * Stop sample recording when the sample dialog is visible and running
     */
    public function stop_sample_recording():Void;

    /**
     * Cancel a currently running sample recording when the sample dialog is visible, otherwise do nothing.
     */
    public function cancel_sample_recording():Void;

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