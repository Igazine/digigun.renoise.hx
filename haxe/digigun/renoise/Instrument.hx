package digigun.renoise;

import digigun.renoise.Document.ObservableList;
import digigun.renoise.Document.Observable;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.Instrument")
extern class Instrument {
    static public final NUMBER_OF_MACROS:UInt;
    static public final MAX_NUMBER_OF_PHRASES:UInt;

    /**
     * Currently active tab in the instrument GUI (samples, plugin or MIDI).
     */
    public var active_tab:Tab;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var active_tab_observable:Observable;

    public var name:String;

    public var name_observable:Observable;

    @:native("comments")
    private var __comments:Table<Int, String>;
    /**
     * Instrument's comment list. See `Song.comments` for more info on how to get notified on changes and how to change it.
     */
    public var comments(get, set):Array<String>;
    private inline function get_comments():Array<String> {
        return this.__comments.toArray();
    }
    private inline function set_comments(value:Array<String>):Array<String> {
        this.__comments = Table.fromArray(value);
        return value;
    }

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var comments_observable:Observable;

    /**
     * Notifier which is called as soon as any paragraph in the comments change.
     */
    public var comments_assignment_observable:Observable;

    /**
     * Set this to true to show the comments dialog after loading a song
     */
    public var show_comments_after_loading:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var show_comments_after_loading_observable:Observable;

    /**
     * Macro parameter pane visibility in the GUI.
     */
    public var macros_visible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var macros_visible_observable:Observable;

    @:native("macros")
    private var __macros:Table<UInt, InstrumentMacro>;
    /**
     * Macro parameters. Array with size Instrument.NUMBER_OF_MACROS.
     */
    public var macros(get, never):Array<InstrumentMacro>;
    private inline function get_macros():Array<InstrumentMacro> {
        return this.__macros.toArray();
    }

    /**
     * Access the MIDI pitch-bend macro
     */
    public var pitchbend_macro:InstrumentMacro;

    /**
     * Access the MIDI modulation-wheel macro
     */
    public var modulation_wheel_macro:InstrumentMacro;

    /**
     * Access the MIDI channel pressure macro
     */
    public var channel_pressure_macro:InstrumentMacro;

    /**
     * Range: (0 - math.db2lin(6))
     */
    public var volume:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var volume_observable:Observable;

    /**
     * Range: (-120 - 120). Global relative pitch in semi tones. Applied to all samples, MIDI and plugins in the instrument.
     */
    public var transpose:Int;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var transpose_observable:Observable;

    /**
     * Global trigger options (quantization and scaling options).
     */
    public var trigger_options:InstrumentTriggerOptions;

    /**
     * Sample mapping's overlap trigger mode.
     */
    public var sample_mapping_overlap_mode:OverlapMode;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var sample_mapping_overlap_mode_observable:Observable;

    /**
     * Phrase editor pane visibility in the GUI.
     */
    public var phrase_editor_visible:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var phrase_editor_visible_observable:Observable;

    /**
     * Phrase playback.
     */
    public var phrase_playback_mode:PhrasePlaybackMode;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var phrase_playback_mode_observable:Observable;

    /**
     * Phrase playback program: 0 = Off, 1-126 = specific phrase, 127 = keymap.
     */
    public var phrase_program:UInt;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var phrase_program_observable:Observable;

    @:native("phrases")
    private var __phrases:Table<UInt, InstrumentPhrase>;
    /**
     * Phrases.
     */
    public var phrases(get, never):Array<InstrumentPhrase>;
    private inline function get_phrases():Array<InstrumentPhrase> {
        return this.__phrases.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var phrases_observable:ObservableList;

    @:native("phrase_mappings")
    private var __phrase_mappings:Table<UInt, InstrumentPhraseMapping>;
    /**
     * Phrase mappings.
     */
    public var phrase_mappings(get, never):Array<InstrumentPhraseMapping>;
    private inline function get_phrase_mappings():Array<InstrumentPhraseMapping> {
        return this.__phrase_mappings.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var phrase_mappings_observable:ObservableList;

    @:native("samples")
    private var __samples:Table<UInt, Sample>;
    /**
     * Samples.
     */
    public var samples(get, never):Array<Sample>;
    private inline function get_samples():Array<Sample> {
        return this.__samples.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var samples_observable:ObservableList;

    @:native("sample_mappings")
    private var __sample_mappings:Table<UInt, SampleMapping>;
    /**
     * Sample mappings.
     */
    public var sample_mappings(get, never):Array<SampleMapping>;
    private inline function get_sample_mappings():Array<SampleMapping> {
        return this.__sample_mappings.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var sample_mappings_observable:ObservableList;

    @:native("sample_modulation_sets")
    private var __sample_modulation_sets:Table<UInt, SampleModulationSet>;
    /**
     * Sample modulation sets.
     */
    public var sample_modulation_sets(get, never):Array<SampleModulationSet>;
    private inline function get_sample_modulation_sets():Array<SampleModulationSet> {
        return this.__sample_modulation_sets.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var sample_modulation_sets_observable:ObservableList;

    @:native("sample_device_chains")
    private var __sample_device_chains:Table<UInt, SampleDeviceChain>;
    /**
     * Sample device chains.
     */
    public var sample_device_chains(get, never):Array<SampleDeviceChain>;
    private inline function get_sample_device_chains():Array<SampleDeviceChain> {
        return this.__sample_device_chains.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var sample_device_chains_observable:ObservableList;

    /**
     * MIDI input properties.
     */
    public final midi_input_properties:InstrumentMidiInputProperties;

    /**
     * MIDI output properties.
     */
    public final midi_output_properties:InstrumentMidiOutputProperties;

    /**
     * Plugin properties.
     */
    public final plugin_properties:InstrumentPluginProperties;

    /**
     * Reset, clear all settings and all samples.
     */
    public function clear():Void;

    /**
     * Copy all settings from the other instrument, including all samples.
     * @param instrument 
     */
    public function copy_from(instrument:Instrument):Void;

    /**
     * Range: (1 - `Instrument.NUMBER_OF_MACROS`) Access a single macro by index. See also property `macros`.
     * @param index 
     * @return InstrumentMacro
     */
    @:native("macro")
    public function macro_(index:UInt):InstrumentMacro;

    /**
     * Insert a new phrase behind the given phrase index (1 for the first one).
     * @param index 
     * @return InstrumentPhrase
     */
    public function insert_phrase_at(index:UInt):InstrumentPhrase;

    /**
     * Delete a new phrase at the given phrase index.
     * @param index 
     */
    public function delete_phrase_at(index:UInt):Void;

    /**
     * Access a single phrase by index. Use properties `phrases` to iterate over all phrases and to query the phrase count.
     * @param index 
     * @return InstrumentPhrase
     */
    public function phrase(index:UInt):InstrumentPhrase;

    /**
     * Returns true if a new phrase mapping can be inserted at the given phrase mapping index (see See renoise.song().instruments[].phrase_mappings). Passed phrase must exist and must not have a mapping yet. Phrase note mappings may not overlap and are sorted by note, so there can be max 119 phrases per instrument when each phrase is mapped to a single key only. To make up room for new phrases, access phrases by index, adjust their note_range, then call 'insert_phrase_mapping_at' again.
     * @param index 
     * @return Bool
     */
    public function can_insert_phrase_mapping_at(index:UInt):Bool;

    /**
     * Insert a new phrase mapping behind the given phrase mapping index. The new phrase mapping will by default use the entire free (note) range between the previous and next phrase (if any). To adjust the note range of the new phrase change its 'new_phrase_mapping.note_range' property.
     * @param index 
     * @param phrase 
     * @return InstrumentPhraseMapping
     */
    public function insert_phrase_mapping_at(index:UInt, phrase:InstrumentPhrase):InstrumentPhraseMapping;

    /**
     * Delete a new phrase mapping at the given phrase mapping index.
     * @param index 
     */
    public function delete_phrase_mapping_at(index:UInt):Void;

    /**
     * Access to a phrase note mapping by index. Use property 'phrase_mappings' to iterate over all phrase mappings and to query the phrase (mapping) count.
     * @param index 
     * @return InstrumentPhraseMapping
     */
    public function phrase_mapping(index:UInt):InstrumentPhraseMapping;

    /**
     * Insert a new empty sample. returns the new renoise.Sample object. Every newly inserted sample has a default mapping, which covers the entire key and velocity range, or it gets added as drum kit mapping when the instrument used a drum-kit mapping before the sample got added.
     * @param index 
     * @return Sample
     */
    public function insert_sample_at(index:UInt):Sample;

    /**
     * Delete an existing sample.
     * @param index 
     */
    public function delete_sample_at(index:UInt):Void;

    /**
     * Swap positions of two samples.
     * @param index1 
     * @param index2 
     */
    public function swap_samples_at(index1:UInt, index2:UInt):Void;

    /**
     * Access to a single sample by index. Use properties 'samples' to iterate over all samples and to query the sample count.
     * @param index 
     * @return Sample
     */
    public function sample(index:UInt):Sample;

    /**
     * Access to a sample mapping by index. Use property 'sample_mappings' to iterate over all sample mappings and to query the sample (mapping) count.
     * @param layer 
     * @param index 
     * @return SampleMapping
     */
    public function sample_mapping(layer:Layer, index:UInt):SampleMapping;

    /**
     * Insert a new modulation set at the given index
     * @param index 
     * @return SampleModulationSet
     */
    public function insert_sample_modulation_set_at(index:UInt):SampleModulationSet;

    /**
     * Delete an existing modulation set at the given index.
     * @param index 
     */
    public function delete_sample_modulation_set_at(index:UInt):Void;

    /**
     * Swap positions of two modulation sets.
     * @param index1 
     * @param index2 
     */
    public function swap_sample_modulation_sets_at(index1:UInt, index2:UInt):Void;

    /**
     * Access to a single sample modulation set by index. Use property 'sample_modulation_sets' to iterate over all sets and to query the set count.
     * @param index 
     * @return SampleModulationSet
     */
    public function sample_modulation_set(index:UInt):SampleModulationSet;

    /**
     * Insert a new sample device chain at the given index
     * @param index 
     * @return SampleDeviceChain
     */
    public function insert_sample_device_chain_at(index:UInt):SampleDeviceChain;

    /**
     * Delete an existing sample device chain at the given index.
     * @param index 
     */
    public function delete_sample_device_chain_at(index:UInt):Void;

    /**
     * Swap positions of two sample device chains.
     * @param index1 
     * @param index2 
     */
    public function swap_sample_device_chains_at(index1:UInt, index2:UInt):Void;

    /**
     * Access to a single device chain by index. Use property 'sample_device_chains' to iterate over all chains and to query the chain count.
     * @param index 
     * @return SampleDeviceChain
     */
    public function sample_device_chain(index:UInt):SampleDeviceChain;

}

enum abstract Tab(Int) from Int to Int {
    var TAB_SAMPLES = 1;
    var TAB_PLUGIN = 2;
    var TAB_EXT_MIDI = 3;
}

enum abstract PhrasePlaybackMode(Int) from Int to Int {
    var PHRASES_OFF = 1;
    var PHRASES_PLAY_SELECTIVE = 2;
    var PHRASES_PLAY_KEYMAP = 3;
}

enum abstract Layer(Int) from Int to Int {
    var LAYER_NOTE_DISABLED = 0;
    var LAYER_NOTE_ON = 1;
    var LAYER_NOTE_OFF = 2;
}

enum abstract OverlapMode(Int) from Int to Int {
    var OVERLAP_MODE_ALL = 0;
    var OVERLAP_MODE_CYCLED = 1;
    var OVERLAP_MODE_RANDOM = 2;
}