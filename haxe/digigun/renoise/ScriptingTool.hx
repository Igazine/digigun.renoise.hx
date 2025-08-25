package digigun.renoise;

import lua.Table;
import digigun.renoise.Document.DocumentNode;
import digigun.renoise.Document.Observable;

/**
 * The scripting tool interface allows your tool to interact with Renoise by injecting or creating menu entries and keybindings into Renoise; or by attaching it to some common tool related notifiers.
 */
@:native("renoise.ScriptingTool")
extern class ScriptingTool {
    /**
     * Full absolute path and name to your tool's bundle directory.
     */
    @:native("bundle_path")
    public final bundlePath:String;

    /**
     * Invoked when the tool finished loading/initializing and no errors happened. When the tool has preferences, they are loaded here as well when the notification fires, but 'renoise.song()' may not yet be available.
     * 
     * See also `app_new_document_observable`.
     */
    @:native("tool_finished_loading_observable")
    public var toolFinishedLoadingObservable:Observable;

    /**
     * Invoked right before a tool gets unloaded: either because it got disabled, reloaded or the application exists. You can cleanup resources or connections to other devices here if necessary.
     */
    @:native("tool_will_unload_observable")
    public var toolWillUnloadObservable:Observable;

    /**
     * Invoked as soon as the application becomes the foreground window. For example, when you ATL-TAB to it, or activate it with the mouse from another app to Renoise.
     */
    @:native("app_became_active_observable")
    public var appBecameActiveObservable:Observable;

    /**
     * Invoked as soon as the application looses focus and another app becomes the foreground window.
     */
    @:native("app_resigned_active_observable")
    public var appResignedActiveObservable:Observable;

    /**
     * Invoked periodically in the background, more often when the work load is low, less often when Renoise's work load is high. The exact interval is undefined and can not be relied on, but will be around 10 times per sec. You can do stuff in the background without blocking the application here. Be gentle and don't do CPU heavy stuff please!
     */
    @:native("app_idle_observable")
    public var appIdleObservable:Observable;

    /**
     * Invoked each time before a new document gets created or loaded: this is the last time renoise.song() still points to the old song before a new one arrives. You can explicitly release notifiers to the old document here, or do your own housekeeping. Also called right before the application exits.
     */
    @:native("app_release_document_observable")
    public var appReleaseDocumentObservable:Observable;

    /**
     * Invoked each time a new document (song) is created or loaded. In other words: each time the result of renoise.song() is changed. Also called when the script gets reloaded (only happens with the auto_reload debugging tools), in order to connect the new script instance to the already running document.
     */
    @:native("app_new_document_observable")
    public var appNewDocumentObservable:Observable;

    /**
     * Invoked just before the application document (song) is saved. This is the last chance to make any changes that should be part of the saved song. You could for example write your tool data to `Song.toolData` here.
     */
    @:native("app_will_save_document_observable")
    public var appWillSaveDocumentObservable:Observable;

    /**
     * Invoked each time the app's document (song) is successfully saved. renoise.song().file_name will point to the filename that it was saved to.
     */
    @:native("app_saved_document_observable")
    public var appSavedDocumentObservable:Observable;

    /**
     * Get or set an optional renoise.Document.DocumentNode object, which will be used as set of persistent "options" or preferences for your tool. By default nil. When set, the assigned document object will automatically be loaded and saved by Renoise, to retain the tools state. The preference XML file is saved/loaded within the tool bundle as "com.example.your_tool.xrnx/preferences.xml".
     * 
     * @see https://renoise.github.io/xrnx/API/renoise/renoise.ScriptingTool.html#preferences--renoisedocumentdocumentnode
     */
    @:native("preferences")
    public var preferences:DocumentNode;

    /**
     * Returns true if the given entry already exists, otherwise false.
     * @param entryName 
     * @return Bool
     */
    @:native("has_menu_entry")
    public function hasMenuEntry(entryName:String):Bool;

    /**
     * Add a new menu entry.
     * @param entry 
     */
    @:native("add_menu_entry")
    public function addMenuEntry(entry:ToolMenuEntry):Void;

    /**
     * Remove a previously added menu entry by specifying its full name.
     * @param entryName 
     */
    @:native("remove_menu_entry")
    public function removeMenuEntry(entryName:String):Void;

    /**
     * Returns true when the given keybinging already exists, otherwise false.
     * @param keybindingName 
     * @return Bool
     */
    @:native("has_keybinding")
    public function hasKeybinding(keybindingName:String):Bool;

    /**
     * Register key bindings somewhere in Renoise's existing set of bindings.
     * @param entry 
     */
    @:native("add_keybinding")
    public function addKeybinding(entry:ToolKeybindingEntry):Void;

    /**
     * Remove a previously added key binding by specifying its name and path.
     * @param keybindingName 
     */
    @:native("remove_keybinding")
    public function removeKeybinding(keybindingName:String):Void;

    /**
     * Returns true when the given mapping already exists, otherwise false.
     * @param midiMappingName 
     * @return Bool
     */
    @:native("has_midi_mapping")
    public function hasMidiMapping(midiMappingName:String):Bool;

    /**
     * Add a new `midiMapping` entry.
     * @param entry 
     */
    @:native("add_midi_mapping")
    public function addMidiMapping(entry:ToolMidiMappingEntry):Void;

    /**
     * Remove a previously added midi mapping by specifying its name.
     * @param midiMappingName 
     */
    @:native("remove_midi_mapping")
    public function removeMidiMapping(midiMappingName:String):Void;

    @:native("has_file_import_hook")
    private function __hasFileImportHook(category:FileHookCategory, extensionsTable:Table<Int, String>):Bool;
    /**
     * Returns true when the given hook already exists, otherwise false.
     * @param category 
     * @param extensionsTable 
     * @return Bool
     */
    public inline function hasFileImportHook(category:FileHookCategory, extensionsTable:Array<String>):Bool {
        var extTable:Table<Int, String> = Table.fromArray(extensionsTable);
        return __hasFileImportHook(category, extTable);
    }

    @:native("add_file_import_hook")
    private function __addFileImportHook(fileImportHook:Dynamic):Void;
    /**
     * Add a new file import hook as described above.
     * @param category 
     */
    public inline function addFileImportHook(fileImportHook:ToolFileImportHook):Void {
        var extTable:Table<Int, String> = Table.fromArray(fileImportHook.extensions);
        __addFileImportHook({ category: fileImportHook.category, extensions: extTable, invoke: fileImportHook.invoke });
    }

    @:native("remove_file_import_hook")
    private function __removeFileImportHook(category:FileHookCategory, extensionsTable:Table<Int, String>):Void;
    /**
     * Remove a previously added file import hook by specifying its category and extension(s)
     * @param category 
     * @param extensionsTable 
     */
    public inline function removeFileImportHook(category:FileHookCategory, extensionsTable:Array<String>):Void {
        var extTable:Table<Int, String> = Table.fromArray(extensionsTable);
        __removeFileImportHook(category, extTable);
    }

    /**
     * Returns true when the given function or method was registered as a timer.
     * @param timerFunction 
     * @return Bool
     */
    @:native("has_timer")
    public function hasTimer(timerFunction:TimerFunction):Bool;

    /**
     * Register a timer function or table with a function and context (a method) that periodically gets called by the `appIdleObservable` for your tool.
     * 
     * Modal dialogs will avoid that timers are called. To create a one-shot timer, simply call remove_timer at the end of your timer function.
     * 
     * `intervalInMs` must be > 0. The exact interval your function is called will vary a bit, depending on workload; e.g. when enough CPU time is available the rounding error will be around +/- 5 ms.
     * @param timerFunction 
     * @param intervalInMs 
     */
    @:native("add_timer")
    public function addTimer(timerFunction:TimerFunction, intervalInMs:Float):Void;

    /**
     * Remove a previously registered timer.
     * @param timerFunction 
     */
    @:native("remove_timer")
    public function removeTimer(timerFunction:TimerFunction):Void;

}

/**
 * Add support for new filetypes in Renoise. Registered file types will show up in Renoise's disk browser and can also be loaded by drag and dropping the files onto the Renoise window. When adding hooks for files which Renoise already supports, your tool's import functions will override the internal import functions.
 *
 * Always load the file into the currently selected component, like `Song.selectedTrack`, `Song.selectedInstrument`, or `Song.selectedSample`.
 *
 * Preloading/prehearing sample files is not supported via tools.
 */
@:native("ToolFileImportHook")
extern typedef ToolFileImportHook = {
    category:FileHookCategory,
    extensions:Array<String>,
    invoke:(String)->Bool,
}

/**
 * Register tool key bindings somewhere in Renoise's existing set of bindings.
 * 
 * Please note: there's no way to define default keyboard shortcuts for your entries. Users manually have to bind them in the keyboard prefs pane. As soon as they do, they'll get saved just like any other key binding in Renoise.
 * 
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.ScriptingTool.html#toolkeybindingentry
 */
@:native("ToolKeybindingEntry")
extern typedef ToolKeybindingEntry = {
    name:String,
    invoke:(Bool)->Void,
}

/**
 * Defines a menu entry somewhere in Renoise's existing context menus or the global app menu. Insertion can be done during script initialization, but can also be done dynamically later on.
 * 
 * You can place your entries in any context menu or any window menu in Renoise. To do so, use one of the specified categories in its name:
 * 
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.ScriptingTool.html#toolmenuentry
 */
@:native("ToolMenuEntry")
extern typedef ToolMenuEntry = {
    name:String,
    invoke:()->Void,
    active:()->Bool,
    selected:()->Bool,
}

/**
 * Extend Renoise's default MIDI mapping set, or add custom MIDI mappings for your tool.
 * 
 * A tool's MIDI mapping can be used just like the regular mappings in Renoise: Either by manually looking its up the mapping in the MIDI mapping list, then binding it to a MIDI message, or when your tool has a custom GUI, specifying the mapping via a control's `Control.midiMapping` property. Such controls will then get highlighted as soon as the MIDI mapping dialog is opened. Then, users simply click on the highlighted control to map MIDI messages.
 * 
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.ScriptingTool.html#toolmidimappingentry
 */
@:native("ToolMidiMappingEntry")
extern typedef ToolMidiMappingEntry = {
    name:String,
    invoke:(MidiMessage)->Void,
}

@:native("FileHookCategory")
enum abstract FileHookCategory(String) to String {
    var Song = "song";
    var Instrument = "instrument";
    var EffectChain = "effect chain";
    var EffectPreset = "effect preset";
    var ModulationSet = "modulation set";
    var Phrase = "phrase";
    var Sample = "sample";
    var Theme = "theme";
}

@:native("TimerFunction")
extern typedef TimerFunction = Void->Void;

/**
 * MIDI message as passed to the `invoke` callback in tool `midiMappings`.
 */
@:native("renoise.ScriptingTool.MidiMessage")
extern class MidiMessage {
    /**
     * Range: (0S - 127) for abs values, Range: (-63 - 63) for relative values valid when `isRelValue()` or `isAbsValue()` returns true, else null
     */
    @:native("int_value")
    public var intValue:Null<Int>;

    /**
     * valid [`true` OR `false`] when `isSwitch()` returns true, else null
     */
    @:native("boolean_value")
    public var booleanValue:Null<Bool>;

    /**
     * returns if action should be invoked
     * @return Bool
     */
    @:native("is_trigger")
    public function isTrigger():Bool;

    /**
     * check if the boolean_value property is valid
     * @return Bool
     */
    @:native("is_switch")
    public function isSwitch():Bool;

    /**
     * check if the int_value property is valid
     * @return Bool
     */
    @:native("is_rel_value")
    public function isRelValue():Bool;

    /**
     * check if the int_value property is valid
     * @return Bool
     */
    @:native("is_abs_value")
    public function isAbsValue():Bool;
}

typedef ToolDefinition = {
    api_version:String,
    author:String,
    auto_upgraded:Bool,
    bundle_path:String,
    category:String,
    cover_path:String,
    description:String,
    discussion:String,
    documentation:String,
    documentation_path:String,
    enabled:Bool,
    homepage:String,
    id:String,
    license:String,
    license_path:String,
    loaded:Bool,
    name:String,
    platform:String,
    repository:String,
    thumbnail_path:String,
    version:String,
}
