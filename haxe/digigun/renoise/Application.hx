package digigun.renoise;

import digigun.renoise.Dialog;
import digigun.renoise.Document.Observable;
import digigun.renoise.ScriptingTool.ToolDefinition;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.Application")
extern class Application {
    /**
     * Access to the application's full log filename and path. Will already be opened for writing, but you nevertheless should be able to read from it.
     */
    @:native("log_filename")
    public final logFilename:String;

    /**
     * Get the apps main document, the song. The global "renoise.song()" function is, in fact, a shortcut to this property.
     */
    @:native("current_song")
    public final currentSong:Song;

    @:native("recently_loaded_song_files")
    private final __recentlyLoadedSongFiles:Table<Int, String>;
    /**
     * List of recently loaded song files.
     */
    public var recentlyLoadedSongFiles(get, never):Array<String>;
    private inline function get_recentlyLoadedSongFiles():Array<String> {
        return __recentlyLoadedSongFiles.toArray();
    }

    @:native("recently_saved_song_files")
    private final __recentlySavedSongFiles:Table<Int, String>;
    /**
     * List of recently saved song files.
     */
    public var recentlySavedSongFiles(get, never):Array<String>;
    private inline function get_recentlySavedSongFiles():Array<String> {
        return __recentlySavedSongFiles.toArray();
    }

    @:native("installed_tools")
    private final __installedTools:Table<Int, ToolDefinition>;
    /**
     * Returns information about all currently installed tools.
     */
    public var installedTools(get, never):Array<ToolDefinition>;
    private inline function get_installedTools():Array<ToolDefinition> {
        return __installedTools.toArray();
    }

    /**
     * Fired when the list of installed tools changed.
     */
    @:native("installed_tools_observable")
    public var installedToolsObservable:Observable;

    /**
     * Fired when the list of available audio plugin effects changed, for example when scanning for new plugins in the preferences. Use the component's `availablePlugins` or `availableDevices` properties to access currently available devices which are supported by the component such as the track device chains.
     */
    @:native("audio_plugin_effects_observable")
    public var audioPluginEffectsObservable:Observable;

    /**
     * Fired when the list of available audio plugin instruments changed, for example when scanning for new plugins in the preferences.
     */
    @:native("audio_plugin_instruments_observable")
    public var audioPluginInstrumentsObservable:Observable;

    /**
     * Access keyboard modifier states.
     */
    @:native("key_modifier_flags")
    public final keyModifierFlags:ModifierFlags;

    /**
     * Access to the application's window.
     */
    @:native("window")
    public final window:ApplicationWindow;

    /**
     * Access to the application's color theme.
     */
    @:native("theme")
    public final theme:ApplicationTheme;

    /**
     * Fired, when any theme color changed. e.g. when a new theme got loaded or when theme colors got edited in the theme preferences.
     */
    @:native("theme_observable")
    public var themeObservable:Observable;

    /**
     * Range: (1 - 4) Get or set globally used clipboard "slots" in the application.
     */
    @:native("active_clipboard_index")
    public var activeClipboardIndex:Int;

    /**
     * Shows an info message dialog to the user.
     * @param message 
     */
    @:native("show_message")
    public function showMessage(message:String):Void;

    /**
     * Shows an error dialog to the user.
     * @param message 
     */
    @:native("show_error")
    public function showError(message:String):Void;
    
    /**
     * Shows a warning dialog to the user.
     * @param message 
     */
    @:native("show_warning")
    public function showWarning(message:String):Void;
    
    /**
     * Shows a message in Renoise's status bar to the user.
     * @param message 
     */
    @:native("show_status")
    public function showStatus(message:String):Void;

    @:native("show_prompt")
    private function __showPrompt(title:String, message:String, ?buttonLabels:Table<Int, String>):String;
    /**
     * Opens a modal dialog with a title, text and custom button labels. Returns the pressed button label or an empty string when canceled.
     * @param title 
     * @param message 
     * @param buttonLabels 
     * @return String
     */
    public inline function showPrompt(title:String, message:String, ?buttonLabels:Array<String>):String {
        if (buttonLabels == null) {
            return __showPrompt(title, message, null);
        } else {
            return __showPrompt(title, message, buttonLabels.toTable());
        }
    }

    //TODO: show_custom_prompt
    //TODO: show_custom_dialog
    //TODO: show_menu

    /**
     * Opens a modal dialog to query an existing directory from the user.
     * @param title 
     * @return String
     */
    @:native("prompt_for_path")
    public function promptForPath(title:DialogTitle):String;

    @:native("prompt_for_filename_to_read")
    private function __promptForFilenameToRead(fileExtensions:Table<Int, String>, title:DialogTitle):String;
    /**
     * Opens a modal dialog to query a filename and path to read from a file.
     * @param fileExtensions 
     * @param title 
     * @return String
     */
    public inline function promptForFilenameToRead(fileExtensions:Array<String>, title:DialogTitle):String {
        return __promptForFilenameToRead(fileExtensions.toTable(), title);
    }

    @:native("prompt_for_multiple_filenames_to_read")
    private function __promptForMultipleFilenamesToRead(fileExtensions:Table<Int, String>, title:DialogTitle):Table<Int, String>;
    /**
     * Same as `promptForFilenameToRead()` but allows the user to select more than one file.
     * @param fileExtensions 
     * @param title 
     * @return Array<String>
     */
    public inline function promptForMultipleFilenamesToRead(fileExtensions:Array<String>, title:DialogTitle):Array<String> {
        return __promptForMultipleFilenamesToRead(fileExtensions.toTable(), title).toArray();
    }

    /**
     * Open a modal dialog to get a filename and path for writing. When an existing file is selected, the dialog will ask whether or not to overwrite it, so you don't have to take care of this on your own.
     * @param fileExtension 
     * @param title 
     * @return String
     */
    @:native("prompt_for_filename_to_write")
    public function promptForFilenameToWrite(fileExtension:String, title:DialogTitle):String;

    /**
     * Opens the default internet browser with the given URL. The URL can also be a file that browsers can open (like xml, html files...).
     * @param url 
     */
    @:native("open_url")
    public function openUrl(url:String):Void;

    /**
     * Opens the default file browser (explorer, finder...) with the given path.
     * @param filePath 
     */
    @:native("open_path")
    public function openPath(filePath:String):Void;

    /**
     * Install order update a tool. Any errors are shown to the user during installation. Installing an already existing tool will upgrade the tool without confirmation. Upgraded tools will automatically be re-enabled, if necessary.
     * @param filePath 
     */
    @:native("install_tool")
    public function installTool(filePath:String):Void;

    /**
     * Uninstall an existing tool. Any errors are shown to the user during uninstallation.
     * @param filePath 
     */
    public function uninstallTool(filePath:String):Void;

    /**
     * Create a new song document (will ask the user to save changes if needed). The song is not created immediately, but soon after the call was made and the user did not aborted the operation. In order to continue execution with the new song, attach a notifier to `Application.newDocumentObservable` See: `renoise.ScriptingTool` for more info.
     */
    @:native("new_song")
    public function newSong():Void;

    /**
     * Create a new song document, avoiding template XRNS songs (when present) to be loaded. The song is not created immediately, but soon after the call was made and the user did not aborted the operation. In order to continue execution with the new song, attach a notifier to `Application.newDocumentObservable` See: `renoise.ScriptingTool` for more info.
     */
    @:native("new_song_no_template")
    public function newSongNoTemplate():Void;

    /**
     * Load a new song document from the given filename (will ask to save changes if needed, any errors are shown to the user). Just like `newSong()`, the song is not loaded immediately, but soon after the call was made. See `Application.newSong()` for details.
     * @param filename 
     */
    @:native("load_song")
    public function loadSong(filename:String):Void;

    /**
     * Load a track device chains into the currently selected track. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_track_device_chain")
    public function loadTrackDeviceChain(filename:String):Bool;

    /**
     * Load a track device devices into the currently selected track. When no device is selected a new device will be created. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_track_device_preset")
    public function loadTrackDevicePreset(filename:String):Bool;

    /**
     * Load an instrument into the currently selected instrument. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument")
    public function loadInstrument(filename:String):Bool;

    /**
     * Load an instrument multi sample into the currently selected instrument. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument_multi_sample")
    public function loadInstrumentMultiSample(filename:String):Bool;

    /**
     * Load an instrument device chain into the currently selected instrument's device chain. When no device chain is selected, a new one will be created. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument_device_chain")
    public function loadInstrumentDeviceChain(filename:String):Bool;

    /**
     * Load an instrument device into the currently selected instrument's device chain's device. When no device is selected, a new one will be created. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument_device_preset")
    public function loadInstrumentDevicePreset(filename:String):Bool;

    /**
     * Load an instrument modulation chain into the currently selected instrument's modulation chain. When no device is selected, a new one will be created. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument_modulation_set")
    public function loadInstrumentModulationSet(filename:String):Bool;

    /**
     * Load an instrument phrase into the currently selected instrument's phrases. When no phrase is selected, a new one will be created. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument_phrase")
    public function loadInstrumentPhrase(filename:String):Bool;

    /**
     * Load an instrument sample into the currently selected instrument's sample lists. When no sample is selected, a new one will be created. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_instrument_sample")
    public function loadInstrumentSample(filename:String):Bool;

    /**
     * Load a new theme file and apply it. Any errors during the export are shown to the user.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("load_theme")
    public function loadTheme(filename:String):Bool;

    /**
     * Quicksave or save the current song under a new name. Any errors during the export are shown to the user.
     */
    @:native("save_song")
    public function saveSong():Void;

    /**
     * Save the current song under a new name. Any errors during the export are shown to the user.
     * @param filename 
     */
    @:native("save_song_as")
    public function saveSongAs(filename:String):Void;

    /**
     * Save a currently selected track device chain to a file with the given name. When no device chain is selected an error is raised. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_track_device_chain")
    public function saveTrackDeviceChain(filename:String):Bool;

    /**
     * Save a currently selected instrument to a file with the given name. When no instrument is selected an error is raised. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_instrument")
    public function saveInstrument(filename:String):Bool;

    /**
     * Save a currently selected instrument multi sample file to a file with the given name. When no instrument is selected an error is raised. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_instrument_multi_sample")
    public function saveInstrumentMultiSample(filename:String):Bool;

    /**
     * Save a currently selected instrument's device chain to a file with the given name. When no chain is selected an error is raised. returns success.
     * @param filename 
     * @return Bool
     */
    @:native("save_instrument_device_chain")
    public function saveInstrumentDeviceChain(filename:String):Bool;

    /**
     * Save a currently selected instrument's modulation set to a file with the given name. When no modulation is selected an error is raised. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_instrument_modulation_set")
    public function saveInstrumentModulationSet(filename:String):Bool;

    /**
     * Save a currently selected instrument's phrase to a file with the given name. When no phrase is selected an error is raised. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_instrument_phrase")
    public function saveInstrumentPhrase(filename:String):Bool;

    /**
     * Save a currently selected instrument's sample to a file with the given name. When no sample is selected an error is raised. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_instrument_sample")
    public function saveInstrumentSample(filename:String):Bool;

    /**
     * Save a current theme to a file with the given name. returns success.
     * @param filename 
     * @return Bool Returns `true` if the call is successful.
     */
    @:native("save_theme")
    public function saveTheme(filename:String):Bool;

}

/**
 * Defines a custom menu entry, shown in custom dialog windows.
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.Application.html#dialogmenuentry
 */
@:native("DialogMenuEntry")
extern typedef DialogMenuEntry = {
    /**
     * Name and optional path of the menu entry
     */
    name:String,
    /**
     * A function that is called as soon as the entry is clicked
     */
    invoke:Void->Void,
    /**
     * Default: true. When false, the action will not be invoked and will be "greyed out".
     */
    ?active:Bool,
    /**
     * Default: false. When true, the entry will be marked as "this is a selected option"
     */
    ?selected:Bool,
}

/**
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.Application.html#keyevent
 */
@:native("KeyEvent")
extern typedef KeyEvent = {
    /**
     * name of the key, like 'esc' or 'a'
     */
    name:String,
    /**
     * the held down modifiers as flags
     */
    modifier_flags:ModifierFlags,
    /**
     * possible character representation of the key
     */
    ?character:String,
    /**
     * virtual keyboard piano key value (starting from 0)
     */
    ?note:String,
    /**
     * only present if `send_key_release` was set to true
     */
    state:KeyState,
    /**
     * only present if `send_key_repeat` was set to true
     */
    ?repeated:Bool,
}

/**
 * The currently pressed/release key's modifiers as platform independent flags. On macOS "control" is their "Command" key and the "meta" keyboard is the "Control" key. On Windows the "meta" key is the "Windows" key and on Linux the "Super" key.
 */
@:native("ModifierFlags")
extern typedef ModifierFlags = {
    alt:Bool,
    control:Bool,
    meta:Bool,
    shift:Bool,
}

enum abstract KeyState(String) to String {
    var Pressed = "pressed";
    var Released = "released";
}

@:native("KeyHandlerOptions")
extern typedef KeyHandlerOptions = {
    ?send_key_repeat:Bool,
    ?send_key_release:Bool,
}

/**
 * The title that shows up at the title-bar of the dialog.
 */
@:native("DialogTitle")
extern typedef DialogTitle = String;

/**
 * Optional focus change notifier for a custom dialog. Will be called when the dialog gains of loses key focus. You maybe want to initialize your dloag's (modifier) keyboard states here.
 */
@:native("FocusHandler")
extern typedef FocusHandler = (dialog:Dialog, focused:Bool) -> Null<KeyEvent>;

/**
 * Optional keyhandler to process key events on a custom dialog. When returning the passed key from the key-handler function, the key will be passed back to Renoise's key event chain, in order to allow processing global Renoise key-bindings from your dialog. This will not work for modal dialogs. This also only applies to global shortcuts in Renoise, because your dialog will steal the focus from all other Renoise views such as the Pattern Editor, etc.
 */
@:native("KeyHandler")
extern typedef KeyHandler = (dialog:Dialog, event:KeyEvent) -> Null<KeyEvent>;