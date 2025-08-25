package digigun.renoise;

import digigun.renoise.ApplicationTheme.RGBColor;
import digigun.renoise.Document.Observable;
import lua.Table;

using digigun.renoise.Helper;

/**
 * Track component of a Renoise song.
 */
@:native("renoise.Track")
extern class Track {
    public final type:TrackType;

    /**
     * Name, as visible in track headers
     */
    public var name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var name_observable:Observable;

    /**
     * A table of 3 bytes (ranging from 0 to 255) representing the red, green and blue channels of a color. {0xFF, 0xFF, 0xFF} is white {165, 73, 35} is the red from the Renoise logo
     */
    public var color:RGBColor;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var color_observable:Observable;

    /**
     * Range: (0 - 100) Color blend in percent
     */
    public var color_blend:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var color_blend_observable:Observable;

    /**
     * Mute and solo states. Not available for the master track.
     */
    public var mute_state:MuteState;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var mute_state_observable:Observable;

    public var solo_state:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var solo_state_observable:Observable;

    public final prefx_volume:DeviceParameter;

    public final prefx_panning:DeviceParameter;

    public final prefx_width:DeviceParameter;

    public final postfx_volume:DeviceParameter;

    public final postfx_panning:DeviceParameter;

    /**
     * Collapsed/expanded visual appearance.
     */
    public var collapsed:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var collapsed_observable:Observable;

    public final group_parent:GroupTrack;

    @:native("available_output_routings")
    private final __availableOutputRoutings:Table<Int, String>;
    public var available_output_routings(get, never):Array<String>;
    private inline function get_available_output_routings():Array<String> {
        return __availableOutputRoutings.toArray();
    }

    /**
     * One of `available_output_routings`
     */
    public var output_routing:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var output_routing_observable:Observable;

    /**
     * Range: (-100.0-100.0) in ms
     */
    public var output_delay:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var output_delay_observable:Observable;

    /**
     * 8 OR 0 depending on the track type
     */
    public final max_effect_columns:UInt;

    /**
     * 1 OR 0 depending on the track type
     */
    public final min_effect_columns:UInt;

    /**
     * 12 OR 0 depending on the track type
     */
    public final max_note_columns:UInt;

    /**
     * 1 OR 0 depending on the track type
     */
    public final min_note_columns:UInt;

    /**
     * 1-8 OR 0-8, depending on the track type
     */
    public var visible_effect_columns:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var visible_effect_columns_observable:Observable;

    /**
     * 0 OR 1-12, depending on the track type
     */
    public var visible_note_columns:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var visible_note_columns_observable:Observable;

    public var volume_column_visible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("volume_column_visible_observable")
    public var volumeColumnVisibleObservable:Observable;

    @:native("panning_column_visible")
    public var panningColumnVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var panning_column_visible_observable:Observable;

    public var delay_column_visible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var delay_column_visible_observable:Observable;

    public var sample_effects_column_visible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("sample_effects_column_visible_observable")
    public var sampleEffectsColumnVisibleObservable:Observable;

    /**
     * FX devices this track can handle.
     */
    @:native("available_devices")
    private final __availableDevices:Table<Int, String>;
    public var available_devices(get, never):Array<String>;
    private inline function get_available_devices():Array<String> {
        return __availableDevices.toArray();
    }

    /**
     * Array of tables containing information about the devices.
     */
    @:native("available_device_infos")
    private final __availableDeviceInfos:Table<Int, AudioDeviceInfo>;
    public var available_device_infos(get, never):Array<AudioDeviceInfo>;
    private inline function get_available_device_infos():Array<AudioDeviceInfo> {
        return __availableDeviceInfos.toArray();
    }

    /**
     * List of audio DSP FX.
     */
    @:native("devices")
    private final __devices:Table<Int, AudioDevice>;
    public var devices(get, never):Array<AudioDevice>;
    private inline function get_devices():Array<AudioDevice> {
        return __devices.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var devices_observable:Observable;

    /**
     * Insert a new device at the given position. `devicePath` must be one of `Track.availableDevices`.
     * @param devicePath 
     * @param deviceIndex 
     * @return AudioDevice
     */
    public function insert_device_at(devicePath:String, deviceIndex:UInt):AudioDevice;

    /**
     * Delete an existing device in a track. **The mixer device at index 1 can not be deleted from any track**.
     * @param deviceIndex 
     * @return AudioDevice
     */
    public function delete_device_at(deviceIndex:UInt):Void;

    /**
     * Swap the positions of two devices in the device chain. The mixer device at index 1 can not be swapped or moved.
     * @param deviceIndex1 
     * @param deviceIndex2 
     */
    public function swap_devices_at(deviceIndex1:UInt, deviceIndex2:UInt):Void;

    /**
     * Access to a single device by index. Use property devices to iterate over all devices and to query the device count.
     * @param deviceIndex 
     * @return AudioDevice
     */
    public function device(deviceIndex:UInt):AudioDevice;

    /**
     * Uses default mute state from the prefs. Not for the master track.
     */
    public function mute():Void;

    public function unmute():Void;

    public function solo():Void;

    /**
     * Note column mutes. Only valid within (1-track.max_note_columns)
     * @param columnIndex 
     * @return Bool
     */
    public function column_is_muted(columnIndex:UInt):Bool;
    
    public function column_is_muted_observable(columnIndex:UInt):Observable;

    public function set_column_is_muted(columnIndex:UInt, muted:Bool):Void;

    /**
     * Note column names. Only valid within (1-track.max_note_columns)
     * @param columnIndex 
     * @return String
     */
    public function column_name(columnIndex:UInt):String;

    public function column_name_observable(columnIndex:UInt):Observable;

    public function set_column_name(columnIndex:UInt, name:String):Void;

    /**
     * Swap the positions of two note or effect columns within a track.
     * @param columnIndex1 
     * @param columnIndex2 
     */
    public function swap_note_columns_at(columnIndex1:UInt, columnIndex2:UInt):Void;

    public function swap_effect_columns_at(columnIndex1:UInt, columnIndex2:UInt):Void;

}

enum abstract TrackType(Int) from Int to Int {
    var TRACK_TYPE_SEQUENCER = 1;
    var TRACK_TYPE_MASTER = 2;
    var TRACK_TYPE_SEND = 3;
    var TRACK_TYPE_GROUP = 4;
}

enum abstract MuteState(Int) from Int to Int {
    var MUTE_STATE_ACTIVE = 1;
    var MUTE_STATE_OFF = 2;
    var MUTE_STATE_MUTED = 3;
}

/**
 * Audio device info
 * 
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.Track.html#audiodeviceinfo
 */
@:native("AudioDeviceInfo")
extern typedef AudioDeviceInfo = {
    path:String,
    name:String,
    short_name:String,
    favorite_name:String,
    is_favorite:Bool,
    is_bridged:Bool,
}
