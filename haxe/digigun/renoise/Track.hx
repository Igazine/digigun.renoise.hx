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
    @:native("name_observable")
    public var nameObservable:Observable;

    /**
     * A table of 3 bytes (ranging from 0 to 255) representing the red, green and blue channels of a color. {0xFF, 0xFF, 0xFF} is white {165, 73, 35} is the red from the Renoise logo
     */
    public var color:RGBColor;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("color_observable")
    public var colorObservable:Observable;

    /**
     * Range: (0 - 100) Color blend in percent
     */
    @:native("color_blend")
    public var colorBlend:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("color_blend_observable")
    public var colorBlendObservable:Observable;

    /**
     * Mute and solo states. Not available for the master track.
     */
    @:native("mute_state")
    public var muteState:MuteState;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("mute_state_observable")
    public var muteStateObservable:Observable;

    @:native("solo_state")
    public var soloState:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("solo_state_observable")
    public var soloStateObservable:Observable;

    @:native("prefx_volume")
    public final prefxVolume:DeviceParameter;

    @:native("prefx_panning")
    public final prefxPanning:DeviceParameter;

    @:native("prefx_width")
    public final prefxWidth:DeviceParameter;

    @:native("postfx_volume")
    public final postfxVolume:DeviceParameter;

    @:native("postfx_panning")
    public final postfxPanning:DeviceParameter;

    /**
     * Collapsed/expanded visual appearance.
     */
    public var collapsed:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("collapsed_observable")
    public var collapsedObservable:Observable;

    @:native("group_parent")
    public final groupParent:GroupTrack;

    @:native("available_output_routings")
    private final __availableOutputRoutings:Table<Int, String>;
    public var availableOutputRoutings(get, never):Array<String>;
    private inline function get_availableOutputRoutings():Array<String> {
        return __availableOutputRoutings.toArray();
    }

    /**
     * One of `availableOutputRoutings`
     */
    @:native("output_routing")
    public var outputRouting:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("output_routing_observable")
    public var outputRoutingObservable:Observable;

    /**
     * Range: (-100.0-100.0) in ms
     */
    @:native("output_delay")
    public var outputDelay:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("output_delay_observable")
    public var outputDelayObservable:Observable;

    /**
     * 8 OR 0 depending on the track type
     */
    @:native("max_effect_columns")
    public final maxEffectColumns:UInt;

    /**
     * 1 OR 0 depending on the track type
     */
    @:native("min_effect_columns")
    public final minEffectColumns:UInt;

    /**
     * 12 OR 0 depending on the track type
     */
    @:native("max_note_columns")
    public final maxNoteColumns:UInt;

    /**
     * 1 OR 0 depending on the track type
     */
    @:native("min_note_columns")
    public final minNoteColumns:UInt;

    /**
     * 1-8 OR 0-8, depending on the track type
     */
    @:native("visible_effect_columns")
    public var visibleEffectColumns:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("visible_effect_columns_observable")
    public var visibleEffectColumnsObservable:Observable;

    /**
     * 0 OR 1-12, depending on the track type
     */
    @:native("visible_note_columns")
    public var visibleNoteColumns:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("visible_note_columns_observable")
    public var visibleNoteColumnsObservable:Observable;

    @:native("volume_column_visible")
    public var volumeColumnVisible:Bool;

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
    @:native("panning_column_visible_observable")
    public var panningColumnVisibleObservable:Observable;

    @:native("delay_column_visible")
    public var delayColumnVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("delay_column_visible_observable")
    public var delayColumnVisibleObservable:Observable;

    @:native("sample_effects_column_visible")
    public var sampleEffectsColumnVisible:Bool;

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
    public var availableDevices(get, never):Array<String>;
    private inline function get_availableDevices():Array<String> {
        return __availableDevices.toArray();
    }

    /**
     * Array of tables containing information about the devices.
     */
    @:native("available_device_infos")
    private final __availableDeviceInfos:Table<Int, AudioDeviceInfo>;
    public var availableDeviceInfos(get, never):Array<AudioDeviceInfo>;
    private inline function get_availableDeviceInfos():Array<AudioDeviceInfo> {
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
    @:native("devices_observable")
    public var devicesObservable:Observable;

    /**
     * Insert a new device at the given position. `devicePath` must be one of `Track.availableDevices`.
     * @param devicePath 
     * @param deviceIndex 
     * @return AudioDevice
     */
    @:native("insert_device_at")
    public function insertDeviceAt(devicePath:String, deviceIndex:UInt):AudioDevice;

    /**
     * Delete an existing device in a track. **The mixer device at index 1 can not be deleted from any track**.
     * @param deviceIndex 
     * @return AudioDevice
     */
    @:native("delete_device_at")
    public function deleteDeviceAt(deviceIndex:UInt):Void;

    /**
     * Swap the positions of two devices in the device chain. The mixer device at index 1 can not be swapped or moved.
     * @param deviceIndex1 
     * @param deviceIndex2 
     */
    @:native("swap_devices_at")
    public function swapDevicesAt(deviceIndex1:UInt, deviceIndex2:UInt):Void;

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
    @:native("column_is_muted")
    public function columnIsMuted(columnIndex:UInt):Bool;

    @:native("column_is_muted_observable")
    public function columnIsMutedObservable(columnIndex:UInt):Observable;

    @:native("set_column_is_muted")
    public function setColumnIsMuted(columnIndex:UInt, muted:Bool):Void;

    /**
     * Note column names. Only valid within (1-track.max_note_columns)
     * @param columnIndex 
     * @return String
     */
    @:native("column_name")
    public function columnName(columnIndex:UInt):String;

    @:native("column_name_observable")
    public function columnNameObservable(columnIndex:UInt):Observable;

    @:native("set_column_name")
    public function setColumnName(columnIndex:UInt, name:String):Void;

    /**
     * Swap the positions of two note or effect columns within a track.
     * @param columnIndex1 
     * @param columnIndex2 
     */
    @:native("swap_note_columns_at")
    public function swapNoteColumnsAt(columnIndex1:UInt, columnIndex2:UInt):Void;

    @:native("swap_effect_columns_at")
    public function swapEffectColumnsAt(columnIndex1:UInt, columnIndex2:UInt):Void;

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
