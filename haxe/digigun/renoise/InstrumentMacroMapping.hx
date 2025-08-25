package digigun.renoise;

import digigun.renoise.Document.Observable;

@:native("renoise.InstrumentMacroMapping")
extern class InstrumentMacroMapping {
    /**
     * Linked parameter. Can be a sample FX- or modulation parameter. Never nil.
     */
    public final parameter:DeviceParameter;

    /**
     * Range: (0 - 1)
     */
    public var parameter_min:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var parameter_min_observable:Observable;

    /**
     * Range: (0 - 1)
     */
    public var parameter_max:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var parameter_max_observable:Observable;

    /**
     * Scaling which gets applied within the min/max range to set the dest value.
     */
    public var parameter_scaling:Scaling;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var parameter_scaling_observable:Observable;

}

enum abstract Scaling(Int) from Int to Int {
    var SCALING_LOG_FAST = 1;
    var SCALING_LOG_SLOW = 2;
    var SCALING_LINEAR = 3;
    var SCALING_EXP_SLOW = 4;
    var SCALING_EXP_FAST = 5;
}