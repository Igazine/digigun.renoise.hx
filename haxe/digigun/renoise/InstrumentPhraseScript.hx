package digigun.renoise;

import digigun.format.dawproject.device.Device;
import digigun.renoise.Document.DocumentList;
import digigun.renoise.Document.Observable;
import digigun.renoise.Document.ObservableList;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.InstrumentPhraseScript")
extern class InstrumentPhraseScript {
    /**
     * When false, a preview of the script is shown instead of a text editor.
     */
    public var editor_visible:Bool;

    /**
     * fired, when the editor visibility changed.
     */
    public var editor_visible_observable:Observable;

    @:native("parameters")
    private var __parameters:Table<Int, DeviceParameter>;
    /**
     * List of script input parameters, if any.
     */
    public var parameters(get, never):Array<DeviceParameter>;
    private inline function get_parameters():Array<DeviceParameter> {
        return __parameters.toArray();
    }

    /**
     * fired, when the input parameter set changed.
     */
    public var parameters_observable:ObservableList;

    @:native("paragraphs")
    private var __paragraphs:Table<Int, String>;
    /**
     * Script content. When changing paragraphs, changes are visible in the script editor, but are not applied for playback until they get committed. See also @function commit and @field committed_observable.
     */
    public var paragraphs(get, never):Array<String>;
    private inline function get_paragraphs():Array<String> {
        return __paragraphs.toArray();
    }

    /**
     * Notifier which is called when a paragraph got added or removed.
     */
    public var paragraphs_observable:DocumentList;

    /**
     * Notifier which is called when existing paragraph content changed.
     */
    public var paragraphs_assignment_observable:Observable;

    /**
     * When not empty, the script failed to compile. This error text is also visible to the user in the script preview.
     */
    public final compile_error:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var compile_error_observable:Observable;

    /**
     * When not empty, script compiled successfully, but caused an error while running. This error text is also visible to the user in the script editor.
     */
    public final runtime_error:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var runtime_error_observable:Observable;

    /**
     * Number of changes since the last commit() or auto-commit call, that have been applied to the parapgraphs. Note: auto-commit only is applied for scripts which are currently edited.
     */
    public final pending_changes:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var pending_changes_observable:Observable;

    /**
     * Fired when script paragraph changes got committed: Either by an explicit commit call or via auto-commit in the editor when the script currently is edited. Script compile errors will be set or cleared after the observable fires as the commit & compilation happens asynchroniously in the player engine.
     */
    public var committed_observable:Observable;

    /**
     * Access to a single input parameter by index. Use properties 'parameters' to iterate over all parameters and to query the parameter count.
     * @param index 
     * @return DeviceParameter
     */
    public function parameter(index:UInt):DeviceParameter;

    /**
     * Commit paragraph changes for playback.
     */
    public function commit():Void;

    /**
     * Render script content with the given options to the phrase pattern. Only committed content will be rendered, so make sure to commit changes first. Parameter rendering_done_callback carries along rendering results:
     * 
     * 1. optional error as string that happened while rendering. nil when succeeded.
     * 2. number of successfully rendered raw events (not pattern lines) or 0.
     * 3. number of skipped raw events, in case the pattern can't fit all events, or 0.
     * 
     * @param options 
     * @param rendering_done_callback 
     */
    public function render_to_pattern(options:RenderScriptOptions, rendering_done_callback:(Any, Any, Any)->Void):Void;

    /**
     * Same as `render_to_pattern()`, but rendering into a temporary phrase object in the clipboard, which can then be pasted by the user somewhere.
     * @param options 
     * @param rendering_done_callback 
     */
    public function render_to_clipboard(options:RenderScriptOptions, rendering_done_callback:(Any, Any, Any)->Void):Void;

}

/**
 * Options for the render functions. All undefined properties will fall back to the user preferences values from the script preview
 * 
 * @see https://renoise.github.io/xrnx/API/renoise/renoise.InstrumentPhraseScript.html#renderscriptoptions
 */
typedef RenderScriptOptions = {
    ?lpb:Float, // Lines per beat of the target phrase.
    ?max_events:Float, // Maximum events (not pattern lines) that will be rendered
}