package digigun.renoise;

import digigun.renoise.Document.Observable;

@:native("renoise.InstrumentMidiOutputProperties")
extern class InstrumentMidiOutputProperties {
    /**
     * Note: ReWire device always start with "ReWire: " in the device_name and will always ignore the instrument_type and channel properties. MIDI channels are not configurable for ReWire MIDI, and instrument_type will always be "TYPE_INTERNAL" for ReWire devices.
     */
    public var instrument_type:Type;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var instrument_type_observable:Observable;

    /**
     * When setting new devices, device names must be one of: renoise.Midi.available_output_devices. Devices are automatically opened when needed. To close a device, set its name to "", e.g. an empty string.
     */
    public var device_name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var device_name_observable:Observable;

    /**
     * Range: (1 - 16)
     */
    public var channel:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var channel_observable:Observable;

    /**
     * Range: (-120 - 120)
     */
    public var transpose:Int;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var transpose_observable:Observable;

    /**
     * Range: (1 - 128) 0 = OFF
     */
    public var program:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var program_observable:Observable;

    /**
     * Range: (1 - 65536) 0 = OFF
     */
    public var bank:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var bank_observable:Observable;

    /**
     * Range: (0 - 100)
     */
    public var delay:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var delay_observable:Observable;

    /**
     * Range: (1 - 8000) 8000 = INF
     */
    public var duration:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var duration_observable:Observable;
    
}

enum abstract Type(Int) from Int to Int {
    var TYPE_EXTERNAL = 1;
    var TYPE_LINE_IN_RETOUCH = 2;
    var TYPE_INTERNAL = 3;
}