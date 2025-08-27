package digigun.renoise;

import lua.Table;
import digigun.renoise.Document.Observable;

using digigun.renoise.Helper;

@:native("renoise.InstrumentPluginProperties")
extern class InstrumentPluginProperties {
    @:native("available_plugins")
    private final available_plugins:Table<Int, String>;
    /**
     * List of all currently available plugins. This is a list of unique plugin names which also contains the plugin's type (VST/AU/DSSI/...), not including the vendor names as visible in Renoise's GUI. So its an identifier, and not the name as visible in the GUI. When no plugin is loaded, the identifier is an empty string.
     */
    public var available_plugins(get, never):Array<String>;
    private inline function get_available_plugins():Array<String> {
        return available_plugins.toArray();
    }

    @:native("available_plugin_infos")
    private final available_plugin_infos:Table<Int, PluginInfo>;
    /**
     * Returns a list of tables containing more information about the plugins.
     */
    public var available_plugin_infos(get, never):Array<PluginInfo>;
    private inline function get_available_plugin_infos():Array<PluginInfo> {
        return available_plugin_infos.toArray();
    }

    /**
     * Returns true when a plugin is present; loaded successfully.
     */
    public final plugin_loaded:Bool;

    /**
     * Valid object for successfully loaded plugins, otherwise nil. Alias plugin instruments of FX will return the resolved device, will link to the device the alias points to. The observable is fired when the device changes: when a plugin gets loaded or unloaded or a plugin alias is assigned or unassigned.
     */
    public var plugin_device:AnyOf2<AudioDevice, InstrumentPluginDevice>;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var plugin_device_observable:Observable;

    /**
     * 0 when no alias instrument is set
     */
    public var alias_instrument_index:UInt;

    /**
     * Track changes to the alias instrument index by attaching listener functions to it.
     */
    public var alias_instrument_index_observable:Observable;

    /**
     * 0 when no alias FX is set
     */
    public final alias_fx_track_index:UInt;

    /**
     * Track changes to the alias FX track index by attaching listener functions to it.
     */
    public var alias_fx_track_index_observable:Observable;

    /**
     * 0 when no alias FX is set
     */
    public final alias_fx_device_index:UInt;

    /**
     * Track changes to the alias FX device index by attaching listener functions to it.
     */
    public var alias_fx_device_index_observable:Observable;

    /**
     * 0 when no routing is set
     */
    public var midi_output_routing_index:UInt;

    /**
     * Track changes to the MIDI output routing index by attaching listener functions to it.
     */
    public var midi_output_routing_index_observable:Observable;

    /**
     * Range: (1 - 16)
     */
    public var channel:UInt;

    /**
     * Track changes to the channel by attaching listener functions to it.
     */
    public var channel_observable:Observable;

    /**
     * Range: (-120 - 120)
     */
    public var transpose:Int;

    /**
     * Track changes to the transpose by attaching listener functions to it.
     */
    public var transpose_observable:Observable;

    /**
     * Range: (0.0 - 4.0) linear gain
     */
    public var volume:Float;

    /**
     * Track changes to the volume by attaching listener functions to it.
     */
    public var volume_observable:Observable;

    /**
     * Valid for loaded and unloaded plugins.
     */
    public var auto_suspend:Bool;

    /**
     * Track changes to the auto_suspend property by attaching listener functions to it.
     */
    public var auto_suspend_observable:Observable;

    /**
     * Load an existing, new, non aliased plugin. Pass an empty string to unload an already assigned plugin. plugin_path must be one of the available plugins See: `InstrumentPluginProperties.available_plugins`
     * @param plugin_path 
     * @return Bool
     */
    public function load_plugin(plugin_path:String):Bool;

}

/**
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.InstrumentPluginProperties.html#plugininfo
 */
typedef PluginInfo = {
    path:String,
    name:String,
    short_name:String,
    favorite_name:String,
    is_favorite:Bool,
    is_bridged:Bool,
}