package digigun.renoise;

import digigun.renoise.Document.Observable;

/**
 * Application's theme colors and other general color theme properties.
 * 
 * Note: All properties and functions of the app theme are read-only, so the theme can't be modified here. Use the app's `renoise.Application.loadTheme()` function to load and apply new themes instead.
 * 
 * Accessing colors and theme properties can be useful in custom viewbuilder widgets.
 */
@:native("renoise.ApplicationTheme")
extern class ApplicationTheme {
    /**
     * Get all theme colors in a flat list of RGBColors. Color table keys are string identifiers as used in the theme XML file, but in lower case.
     * 
     * Note that if you only need to access a single color from the theme, use `renoise.app().theme.color(colorName)` instead.
     * 
     * To get notified of color changes, use `renoise.app().themeObservable`
     */
    //TODO
    public final colors:Dynamic;
    
    /**
     * Get theme's knob shade setting. Range: (1 - 2)
     */
    @:native("knob_shade")
    public final knobShade:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("knob_shade_observable")
    public var knobShadeObservable:Observable;

    /**
     * Get theme's body shade setting. Range: (1 - 2)
     */
    @native("body_shade")
    public final bodyShade:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("body_shade_observable")
    public var bodyShadeObservable:Observable;

    /**
     * Get theme's contrast setting. Range: (-0.5 - 0.5)
     */
    public final contrast:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("contrast_observable")
    public var contrastObservable:Observable;

    /**
     * Get theme's texture set name
     */
    @:native("texture_set")
    public final textureSet:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("texture_set_observable")
    public var textureSetObservable:Observable;

    /**
     * Get a single color from the theme using a color identifier as used in the theme XML file - but in lower case.
     * 
     * e.g. to access the button background color from the theme, use `renoise.app().theme.color(ThemeColor.ButtonBack)`
     * 
     * To get notified of color changes, use `renoise.app().themeObservable`
     * @param colorName 
     * @return RGBColor
     */
    public function color(colorName:ThemeColor):RGBColor;

}

typedef RGBColor = {
    var R:Int;
    var G:Int;
    var B:Int;
}

enum abstract ThemeColor(String) from String to String {
    var MainBack = "main_back";
    var MainFont = "main_font";
    var AlternateMainBack = "alternate_main_back";
    var AlternateMainFont = "alternate_main_font";
    var BodyBack = "body_back";
    var BodyFont = "body_font";
    var StrongBodyFont = "strong_body_font";
    var ButtonBack = "button_back";
    var ButtonFont = "button_font";
    var ButtonHighlightFont = "button_highlight_font";
    var SelectedButtonBack = "selected_button_back";
    var SelectedButtonFont = "selected_button_font";
    var SelectionBack = "selection_back";
    var SelectionFont = "selection_font";
    var StandbySelectionBack = "standby_selection_back";
    var StandbySelectionFont = "standby_selection_font";
    var MidiMappingBack = "midi_mapping_back";
    var MidiMappingFont = "midi_mapping_font";
    var TooltipBack = "tooltip_back";
    var TooltipFont = "tooltip_font";
    var ValueboxBack = "valuebox_back";
    var ValueboxFont = "valuebox_font";
    var ValueboxFontIcons = "valuebox_font_icons";
    var Scrollbar = "scrollbar";
    var Slider = "slider";
    var Folder = "folder";
    var PatternDefaultBack = "pattern_default_back";
    var PatternDefaultFont = "pattern_default_font";
    var PatternDefaultFontVolume = "pattern_default_font_volume";
    var PatternDefaultFontPanning = "pattern_default_font_panning";
    var PatternDefaultFontPitch = "pattern_default_font_pitch";
    var PatternDefaultFontDelay = "pattern_default_font_delay";
    var PatternDefaultFontGlobal = "pattern_default_font_global";
    var PatternDefaultFontOther = "pattern_default_font_other";
    var PatternDefaultFontDspfx = "pattern_default_font_dspfx";
    var PatternDefaultFontUnused = "pattern_default_font_unused";
    var PatternHighlightedBack = "pattern_highlighted_back";
    var PatternHighlightedFont = "pattern_highlighted_font";
    var PatternHighlightedFontVolume = "pattern_highlighted_font_volume";
    var PatternHighlightedFontPanning = "pattern_highlighted_font_panning";
    var PatternHighlightedFontPitch = "pattern_highlighted_font_pitch";
    var PatternHighlightedFontDelay = "pattern_highlighted_font_delay";
    var PatternHighlightedFontGlobal = "pattern_highlighted_font_global";
    var PatternHighlightedFontOther = "pattern_highlighted_font_other";
    var PatternHighlightedFontDspfx = "pattern_highlighted_font_dspfx";
    var PatternHighlightedFontUnused = "pattern_highlighted_font_unused";
    var PatternPlaypositionBack = "pattern_playposition_back";
    var PatternPlaypositionFont = "pattern_playposition_font";
    var PatternCenterbarBack = "pattern_centerbar_back";
    var PatternCenterbarFont = "pattern_centerbar_font";
    var PatternCenterbarBackStandby = "pattern_centerbar_back_standby";
    var PatternCenterbarFontStandby = "pattern_centerbar_font_standby";
    var PatternSelection = "pattern_selection";
    var PatternStandbySelection = "pattern_standby_selection";
    var PatternMuteState = "pattern_mute_state";
    var AutomationGrid = "automation_grid";
    var AutomationLineEdge = "automation_line_edge";
    var AutomationLineFill = "automation_line_fill";
    var AutomationPoint = "automation_point";
    var AutomationMarkerPlay = "automation_marker_play";
    var AutomationMarkerSingle = "automation_marker_single";
    var AutomationMarkerPair = "automation_marker_pair";
    var AutomationMarkerDiamond = "automation_marker_diamond";
    var VumeterMeter = "vumeter_meter";
    var VumeterMeterLow = "vumeter_meter_low";
    var VumeterMeterMiddle = "vumeter_meter_middle";
    var VumeterMeterHigh = "vumeter_meter_high";
    var VumeterPeak = "vumeter_peak";
    var VumeterBackNormal = "vumeter_back_normal";
    var VumeterBackClipped = "vumeter_back_clipped";
    var DefaultColor01 = "default_color_01";
    var DefaultColor02 = "default_color_02";
    var DefaultColor03 = "default_color_03";
    var DefaultColor04 = "default_color_04";
    var DefaultColor05 = "default_color_05";
    var DefaultColor06 = "default_color_06";
    var DefaultColor07 = "default_color_07";
    var DefaultColor08 = "default_color_08";
    var DefaultColor09 = "default_color_09";
    var DefaultColor10 = "default_color_10";
    var DefaultColor11 = "default_color_11";
    var DefaultColor12 = "default_color_12";
    var DefaultColor13 = "default_color_13";
    var DefaultColor14 = "default_color_14";
    var DefaultColor15 = "default_color_15";
    var DefaultColor16 = "default_color_16";
}