package digigun.renoise;

import digigun.renoise.Document;

@:native("renoise.ApplicationWindow")
extern class ApplicationWindow {
    /**
     * Get/set if the application is running fullscreen
     */
    @:native("fullscreen")
    public var fullscreen:Bool;

    /**
     * Window status flag.
     */
    @:native("is_maximized")
    public final isMaximized:Bool;

    /**
     * Window status flag.
     */
    @:native("is_minimized")
    public final isMinimized:Bool;

    /**
     * When true, the middle frame views (like the pattern editor) will stay focused unless alt or middle mouse is clicked.
     */
    @:native("lock_keyboard_focus")
    public var lockKeyboardFocus:Bool;

    /**
     * Dialog for recording new samples, floating above the main window.
     */
    @:native("sample_record_dialog_is_visible")
    public var sampleRecordDialogIsVisible:Bool;

    /**
     * Diskbrowser Panel.
     */
    @:native("disk_browser_is_visible")
    public var diskBrowserIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("disk_browser_is_visible_observable")
    public var diskBrowserIsVisibleObservable:Observable;

    @:native("disk_browser_category")
    public var diskBrowserCategory:DiskBrowserCategory;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("disk_browser_category_observable")
    public var diskBrowserCategoryObservable:Observable;

    @:native("instrument_box_is_visible")
    public var instrumentBoxIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("instrument_box_is_visible_observable")
    public var instrumentBoxIsVisibleObservable:Observable;

    /**
     * InstrumentBox slot size
     */
    @:native("instrument_box_slot_size")
    public var instrumentBoxSlotSize:InstrumentBoxSlotSize;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("instrument_box_slot_size_observable")
    public var instrumentBoxSlotSizeObservable:Observable;

    /**
     * Instrument Editor detaching.
     */
    @:native("instrument_editor_is_detached")
    public var instrumentEditorIsDetached:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("instrument_editor_is_detached_observable")
    public var instrumentEditorIsDetachedObservable:Observable;

    /**
     * InstrumentProperties (below InstrumentBox)
     */
    @:native("instrument_properties_is_visible")
    public var instrumentPropertiesIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("instrument_properties_is_visible_observable")
    public var instrumentPropertiesIsVisibleObservable:Observable;

    @:native("instrument_properties_show_volume_transpose")
    public var instrumentPropertiesShowVolumeTranspose:Bool;

    @:native("instrument_properties_show_trigger_options")
    public var instrumentPropertiesShowTriggerOptions:Bool;

    @:native("instrument_properties_show_scale_options")
    public var instrumentPropertiesShowScaleOptions:Bool;

    @:native("instrument_properties_show_plugin")
    public var instrumentPropertiesShowPlugin:Bool;

    @:native("instrument_properties_show_plugin_program")
    public var instrumentPropertiesShowPluginProgram:Bool;

    @:native("instrument_properties_show_midi")
    public var instrumentPropertiesShowMidi:Bool;

    @:native("instrument_properties_show_midi_program")
    public var instrumentPropertiesShowMidiProgram:Bool;

    @:native("instrument_properties_show_macros")
    public var instrumentPropertiesShowMacros:Bool;

    @:native("instrument_properties_show_phrases")
    public var instrumentPropertiesShowPhrases:Bool;

    /**
     * SampleProperties (below SampleNavigator)
     */
    @:native("sample_properties_is_visible")
    public var samplePropertiesIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("sample_properties_is_visible_observable")
    public var samplePropertiesIsVisibleObservable:Observable;

    /**
     * Mixer View detaching.
     */
    @:native("mixer_view_is_detached")
    public var mixerViewIsDetached:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("mixer_view_is_detached_observable")
    public var mixerViewIsDetachedObservable:Observable;

    /**
     * Frame with the scopes/master spectrum...
     */
    @:native("upper_frame_is_visible")
    public var upperFrameIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("upper_frame_is_visible_observable")
    public var upperFrameIsVisibleObservable:Observable;

    @:native("active_upper_frame")
    public var activeUpperFrame:UpperFrame;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("active_upper_frame_observable")
    public var activeUpperFrameObservable:Observable;

    /**
     * Frame with the pattern editor, mixer...
     */
    @:native("active_middle_frame")
    public var activeMiddleFrame:MiddleFrame;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("active_middle_frame_observable")
    public var activeMiddleFrameObservable:Observable;

    /**
     * Frame with the DSP chain view, automation, etc.
     */
    @:native("lower_frame_is_visible")
    public var lowerFrameIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("lower_frame_is_visible_observable")
    public var lowerFrameIsVisibleObservable:Observable;

    @:native("active_lower_frame")
    public var activeLowerFrame:LowerFrame;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("active_lower_frame_observable")
    public var activeLowerFrameObservable:Observable;

    /**
     * Frame with Disk Browser and Instrument Box.
     */
    @:native("right_frame_is_visible")
    public var rightFrameIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("right_frame_is_visible_observable")
    public var rightFrameIsVisibleObservable:Observable;

    /**
     * Pattern matrix, visible in pattern editor and mixer only...
     */
    @:native("pattern_matrix_is_visible")
    public var patternMatrixIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("pattern_matrix_is_visible_observable")
    public var patternMatrixIsVisibleObservable:Observable;

    /**
     * Pattern advanced edit, visible in pattern editor only...
     */
    @:native("pattern_advanced_edit_is_visible")
    public var patternAdvancedEditIsVisible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("pattern_advanced_edit_is_visible_observable")
    public var patternAdvancedEditIsVisibleObservable:Observable;

    /**
     * Mixer views Pre/Post volume setting.
     */
    @:native("mixer_view_post_fx")
    public var mixerViewPostFx:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("mixer_view_post_fx_observable")
    public var mixerViewPostFxObservable:Observable;

    /**
     * Mixer fader type setting.
     */
    @:native("mixer_fader_type")
    public var mixerFaderType:MixerFader;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("mixer_fader_type_observable")
    public var mixerFaderTypeObservable:Observable;

    /**
     * Expand the window over the entire screen, without hiding menu bars, docks and so on.
     */
    @:native("maximize")
    public function maximize():Void;

    /**
     * Minimize the window to the dock or taskbar, depending on the OS.
     */
    @:native("minimize")
    public function minimize():Void;

    /**
     * "un-maximize" or "un-minimize" the window, or just bring it to front.
     */
    @:native("restore")
    public function restore():Void;

    /**
     * Select/activate one of the global view presets, to memorize/restore the user interface layout.
     * @param presetIndex 
     */
    @:native("select_preset")
    public function selectPreset(presetIndex:Int):Void;

}

enum abstract UpperFrame(Int) from Int to Int {
    final UPPER_FRAME_TRACK_SCOPES = 1;
    final UPPER_FRAME_MASTER_SPECTRUM = 2;
}

enum abstract MiddleFrame(Int) from Int to Int {
    final MIDDLE_FRAME_PATTERN_EDITOR = 1;
    final MIDDLE_FRAME_MIXER = 2;
    final MIDDLE_FRAME_INSTRUMENT_PHRASE_EDITOR = 3;
    final MIDDLE_FRAME_INSTRUMENT_SAMPLE_KEYZONES = 4;
    final MIDDLE_FRAME_INSTRUMENT_SAMPLE_EDITOR = 5;
    final MIDDLE_FRAME_INSTRUMENT_SAMPLE_MODULATION = 6;
    final MIDDLE_FRAME_INSTRUMENT_SAMPLE_EFFECTS = 7;
    final MIDDLE_FRAME_INSTRUMENT_PLUGIN_EDITOR = 8;
    final MIDDLE_FRAME_INSTRUMENT_MIDI_EDITOR = 9;
}

enum abstract LowerFrame(Int) from Int to Int {
    final LOWER_FRAME_TRACK_DSPS = 1;
    final LOWER_FRAME_TRACK_AUTOMATION = 2;
}

enum abstract DiskBrowserCategory(Int) from Int to Int {
    final DISK_BROWSER_CATEGORY_SONGS = 1;
    final DISK_BROWSER_CATEGORY_INSTRUMENTS = 2;
    final DISK_BROWSER_CATEGORY_SAMPLES = 3;
    final DISK_BROWSER_CATEGORY_OTHER = 4;
}

enum abstract InstrumentBoxSlotSize(Int) from Int to Int {
    final INSTRUMENT_BOX_SLOT_SIZE_SMALL = 1;
    final INSTRUMENT_BOX_SLOT_SIZE_MEDIUM = 2;
    final INSTRUMENT_BOX_SLOT_SIZE_LARGE = 3;
}

enum abstract MixerFader(Int) from Int to Int {
    final MIXER_FADER_TYPE_24DB = 1;
    final MIXER_FADER_TYPE_48DB = 2;
    final MIXER_FADER_TYPE_96DB = 3;
    final MIXER_FADER_TYPE_LINEAR = 4;
}
