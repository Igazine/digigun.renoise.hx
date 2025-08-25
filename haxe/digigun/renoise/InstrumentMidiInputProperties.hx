package digigun.renoise;

import digigun.renoise.Document.Observable;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.InstrumentMidiInputProperties")
extern class InstrumentMidiInputProperties {
    /**
     * When setting new devices, device names must be one of renoise.Midi.available_input_devices. Devices are automatically opened when needed. To close a device, set its name to "", e.g. an empty string.
     */
    public var device_name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var device_name_observable:Observable;

    /**
     * Range: (1 - 16) 0 = Omni
     */
    public var channel:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var channel_observable:Observable;

    @:native("note_range")
    private var __note_range:Table<Int, Int>;
    /**
     * Table of two numbers in range (0-119) where C-4 is 48
     */
    public var note_range(get, set):Array<Int>;
    private inline function get_note_range():Array<Int> {
        return this.__note_range.toArray();
    }
    private inline function set_note_range(value:Array<Int>):Array<Int> {
        this.__note_range = Table.fromArray(value);
        return value;
    }

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var note_range_observable:Observable;

    /**
     * Range: (1 - song.sequencer_track_count) 0 = Current track
     */
    public var assigned_track:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var assigned_track_observable:Observable;
}