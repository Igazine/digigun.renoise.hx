package digigun.renoise;

import digigun.renoise.Document;

/**
 * A single parameter within an audio DSP effect (renoise.AudioDevice)
 */
@:native("renoise.DeviceParameter")
extern class DeviceParameter {
    public final name:String;

    @:native("name_observable")
    public function nameObservable():ObservableString;

    public final polarity:Polarity;

    @:native("value_min")
    public final valueMin:Float;

    @:native("value_max")
    public final valueMax:Float;

    @:native("value_quantum")
    public final valueQuantum:Float;

    @:native("value_default")
    public final valueDefault:Float;

    @:native("time_quantum")
    public final timeQuantum:Float;

    @:native("is_automatable")
    public final isAutomatable:Bool;

    /**
     * Is automated. Not valid for parameters of instrument devices.
     */
    @:native("is_automated")
    public final isAutomated:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("is_automated_observable")
    public var isAutomatedObservable:Observable;

    /**
     * Parameter has a custom MIDI mapping in the current song.
     */
    @:native("is_midi_mapped")
    public final isMidiMapped:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("is_midi_mapped_observable")
    public var isMidiMappedObservable:Observable;

    /**
     * Show in mixer. Not valid for parameters of instrument devices.
     */
    @:native("show_in_mixer")
    public var showInMixer:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("show_in_mixer_observable")
    public var showInMixerObservable:Observable;

    /**
     * value in Range: (`valueMin` - `valueMax`)
     */
    public var value:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("value_observable")
    public var valueObservable:Observable;

    @:native("value_string")
    public var valueString:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("value_string_observable")
    public var valueStringObservable:Observable;

    /**
     * Set a new value and write automation when the MIDI mapping "record to automation" option is set. Only works for parameters of track devices, not for instrument devices.
     * @param value 
     */
    @:native("record_value")
    public function recordValue(value:Float):Void;

}

enum abstract Polarity(Int) from Int to Int {
    var POLARITY_UNIPOLAR = 1;
    var POLARITY_BIPOLAR = 2;
}