package digigun.renoise;

import digigun.renoise.Document.Observable;
import lua.Table;

using digigun.renoise.Helper;

/**
 * Audio DSP device in tracks or sample device chains.
 */
@:native("renoise.AudioDevice")
extern class AudioDevice {
    public final name:String;

    @:native("short_name")
    public final shortName:String;

    /**
     * Configurable device display name. When empty `name` is displayed.
     */
    @:native("display_name")
    public final displayName:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("display_name_observable")
    public var displayNameObservable:Observable;

    /**
     * !active = bypassed
     */
    @:native("is_active")
    public var isActive:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("is_active_observable")
    public var isActiveObservable:Observable;

    /**
     * Maximize state in DSP chain.
     */
    @:native("is_maximized")
    public var isMaximized:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("is_maximized_observable")
    public var isMaximizedObservable:Observable;

    /**
     * 0 when none is active or available
     */
    @:native("active_preset")
    public var activePreset:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("active_preset_observable")
    public var activePresetObservable:Observable;

    /**
     * raw serialized data in XML format of the active preset
     */
    @:native("active_preset_data")
    public var activePresetData:String;

    @:native("presets")
    private final __presets:Table<Int, String>;
    public var presets(get, never):Array<String>;
    private inline function get_presets():Array<String> {
        return __presets.toArray();
    }

    @:native("is_active_parameter")
    public final isActiveParameter:DeviceParameter;

    @:native("parameters")
    private final __parameters:Table<Int, DeviceParameter>;
    public var parameters(get, never):Array<DeviceParameter>;
    private inline function get_parameters():Array<DeviceParameter> {
        return __parameters.toArray();
    }

    /**
     * Returns whether or not the device provides its own custom GUI (only available for some plugin devices)
     */
    @:native("external_editor_available")
    public final externalEditorAvailable:Bool;

    /**
     * true to show the editor, false to close it
     */
    @:native("external_editor_visible")
    public var externalEditorVisible:Bool;

    /**
     * Returns a string that uniquely identifies the device, from available_devices. The string can be passed into: `renoise.song().tracks[].insert_device_at()`
     */
    @:native("device_path")
    public final devicePath:String;

    /**
     * Access to a single preset name by index. Use properties 'presets' to iterate over all presets and to query the presets count
     * @param index 
     * @return String
     */
    public function preset(index:UInt):String;

    /**
     * Access to a single parameter by index. Use properties 'parameters' to iterate over all parameters and to query the parameter count.
     * @param index 
     * @return DeviceParameter
     */
    public function parameter(index:UInt):DeviceParameter;
}