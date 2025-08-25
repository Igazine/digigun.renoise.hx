package digigun.renoise;

import haxe.ds.Either;
import digigun.renoise.SongPos;
import digigun.renoise.Document;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.Song")
extern class Song {
    @:native("MAX_NUMBER_OF_INSTRUMENTS")
    static public final MAX_NUMBER_OF_INSTRUMENTS:Int;

    /**
     * When the song is loaded from or saved to a file, the absolute path and name to the XRNS file, otherwise an empty string.
     */
    @:native("file_name")
    public final fileName:String;

    /**
     * Song Comments
     */
    @:native("artist")
    public var artist:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("artist_observable")
    public var artistObservable:Observable;

    @:native("name")
    public var name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("name_observable")
    public var nameObservable:Observable;

    @:native("comments")
    private var __comments:Table<Int, String>;
    /**
     * Note: All property tables of basic types in the API are temporary copies. In other words comments = `{ "Hello", "World" }` will work, `comments[1] = "Hello"; renoise.song().comments[2] = "World"` will not work.
     */
    public var comments(get, set):Array<String>;
    private inline function get_comments() {
        return __comments.toArray();
    }
    private inline function set_comments(value:Array<String>) {
        __comments = value.toTable();
        return value;
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    @:native("comments_observable")
    public var commentsObservable:ObservableList;

    /**
     * Notifier is called as soon as any paragraph in the comments change.
     */
    @:native("comments_assignment_observable")
    public final commentsAssignmentObservable:Observable;

    /**
     * Set this to true to show the comments dialog after loading a song
     */
    @:native("show_comments_after_loading")
    public var showCommentsAfterLoading:Bool;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("show_comments_after_loading_observable")
    public var showCommentsAfterLoadingObservable:Observable;

    /**
     * Inject/fetch custom XRNX scripting tool data into the song. Can only be called from scripts that are running in Renoise scripting tool bundles; attempts to access the data from e.g. the scripting terminal will result in an error. Returns nil when no data is present.
     * 
     * Each tool gets it's own data slot in the song, which is resolved by the tool's bundle id, so this data is unique for every tool and persistent across tools with the same bundle id (but possibly different versions). If you want to store renoise.Document data in here, you can use the renoise.Document's 'to_string' and 'from_string' functions to serialize the data. Alternatively, write your own serializers for your custom data.
     */
    @:native("tool_data")
    public var toolData:Null<String>;

    /**
     * True while rendering is in progress.
     */
    @:native("rendering")
    public final rendering:Bool;

    /**
     * Range: (0.0 - 1.0)
     */
    @:native("rendering_progress")
    public final renderingProgress:Float;

    @:native("transport")
    public final transport:Transport;

    @:native("sequencer")
    public final sequencer:PatternSequencer;

    @:native("pattern_iterator")
    public final patternIterator:PatternIterator;

    /**
     * number of normal playback tracks (non-master or sends) in song.
     */
    @:native("sequencer_track_count")
    public final sequencerTrackCount:Int;

    /**
     * number of send tracks in song.
     */
    @:native("send_track_count")
    public final sendTrackCount:Int;

    @:native("instruments")
    private final __instruments:Table<Int, Instrument>;
    /**
     * Instrument arrays
     */
    public var instruments(get, never):Array<Instrument>;
    private inline function get_instruments() {
        return __instruments.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    @:native("instruments_observable")
    public var instrumentsObservable:ObservableList;

    @:native("patterns")
    private final __patterns:Table<Int, Pattern>;
    /**
     * Pattern arrays
     */
    public var patterns(get, never):Array<Pattern>;
    private inline function get_patterns() {
        return __patterns.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    @:native("patterns_observable")
    public var patternsObservable:ObservableList;

    @:native("tracks")
    private final __tracks:Table<Int, Track>;
    /**
     * Track arrays
     */
    public var tracks(get, never):Array<Track>;
    private inline function get_tracks() {
        return __tracks.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    @:native("tracks_observable")
    public var tracksObservable:ObservableList;

    /**
     * Selected in the instrument box.
     */
    @:native("selected_instrument")
    public final selectedInstrument:Instrument;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_instrument_observable")
    public var selectedInstrumentObservable:Observable;

    /**
     * Selected instrument index in the instrument box.
     */
    @:native("selected_instrument_index")
    public final selectedInstrumentIndex:Int;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_instrument_index_observable")
    public var selectedInstrumentIndexObservable:Observable;

    /**
     * Selected phrase the instrument's phrase map piano view.
     */
    @:native("selected_phrase")
    public final selectedPhrase:InstrumentPhrase;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_phrase_observable")
    public var selectedPhraseObservable:Observable;

    /**
     * Selected phrase index the instrument's phrase map piano view.
     */
    @:native("selected_phrase_index")
    public final selectedPhraseIndex:Int;

    /**
     * Selected in the instrument's sample list. Only nil when no samples are present in the selected instrument.
     */
    @:native("selected_sample")
    public final selectedSample:Sample;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_sample_observable")
    public var selectedSampleObservable:Observable;

    /**
     * Selected sample index in the instrument's sample list. Only 0 when no samples are present in the selected instrument.
     */
    @:native("selected_sample_index")
    public final selectedSampleIndex:Int;

    /**
     * Selected in the instrument's modulation view.
     */
    @:native("selected_sample_modulation_set")
    public final selectedSampleModulationSet:SampleModulationSet;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_sample_modulation_set_observable")
    public var selectedSampleModulationSetObservable:Observable;

    /**
     * Selected modulation set index in the instrument's modulation view.
     */
    @:native("selected_sample_modulation_set_index")
    public final selectedSampleModulationSetIndex:Int;

    /**
     * Selected in the instrument's effects view.
     */
    @:native("selected_sample_device_chain")
    public final selectedSampleDeviceChain:SampleDeviceChain;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_sample_device_chain_observable")
    public var selectedSampleDeviceChainObservable:Observable;

    /**
     * Selected chain index in the instrument's effects view.
     */
    @:native("selected_sample_device_chain_index")
    public final selectedSampleDeviceChainIndex:Int;

    /**
     * Selected in the sample effect mixer.
     */
    @:native("selected_sample_device")
    public final selectedSampleDevice:AudioDevice;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_sample_device_observable")
    public var selectedSampleDeviceObservable:Observable;

    /**
     * Selected device index in the sample effect mixer.
     */
    @:native("selected_sample_device_index")
    public final selectedSampleDeviceIndex:Int;

    /**
     * Selected in the pattern editor or mixer.
     */
    @:native("selected_track")
    public final selectedTrack:Track;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_track_observable")
    public var selectedTrackObservable:Observable;

    /**
     * Selected track index in the pattern editor or mixer.
     */
    @:native("selected_track_index")
    public final selectedTrackIndex:Int;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_track_index_observable")
    public var selectedTrackIndexObservable:Observable;

    /**
     * Selected in the track DSP chain editor.
     */
    @:native("selected_track_device")
    public final selectedTrackDevice:AudioDevice;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_track_device_observable")
    public var selectedTrackDeviceObservable:Observable;

    /**
     * Selected device index in the track DSP chain editor.
     */
    @:native("selected_track_device_index")
    public final selectedTrackDeviceIndex:Int;

    /**
     * Selected parameter in the automation editor. When setting a new parameter, parameter must be automateable and must be one of the currently selected track device chain.
     */
    @:native("selected_automation_parameter")
    public var selectedAutomationParameter:DeviceParameter;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_automation_parameter_observable")
    public var selectedAutomationParameterObservable:Observable;

    /**
     * Parent device of `selected_automation_parameter`.
     */
    @:native("selected_automation_device")
    public final selectedAutomationDevice:AudioDevice;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_automation_device_observable")
    public var selectedAutomationDeviceObservable:Observable;

    /**
     * The currently edited pattern.
     */
    @:native("selected_pattern")
    public final selectedPattern:Pattern;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_pattern_observable")
    public var selectedPatternObservable:Observable;

    /**
     * The currently edited pattern index.
     */
    @:native("selected_pattern_index")
    public final selectedPatternIndex:Int;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_pattern_index_observable")
    public var selectedPatternIndexObservable:Observable;

    /**
     * The currently edited pattern track object. and selected_track_observable for notifications.
     */
    @:native("selected_pattern_track")
    public final selectedPatternTrack:PatternTrack;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_pattern_track_observable")
    public var selectedPatternTrackObservable:Observable;

    /**
     * The currently edited sequence position.
     */
    @:native("selected_sequence_index")
    public var selectedSequenceIndex:Int;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    @:native("selected_sequence_index_observable")
    public var selectedSequenceIndexObservable:Observable;

    /**
     * The currently edited line in the edited pattern.
     */
    @:native("selected_line")
    public final selectedLine:PatternLine;

    @:native("selected_line_index")
    public var selectedLineIndex:Int;

    /**
     * The currently edited column in the selected line in the edited sequence/pattern. Nil when an effect column is selected.
     */
    @:native("selected_note_column")
    public final selectedNoteColumn:NoteColumn;

    @:native("selected_note_column_index")
    public var selectedNoteColumnIndex:Int;

    /**
     * The currently edited column in the selected line in the edited sequence/pattern. Nil when a note column is selected.
     */
    @:native("selected_effect_column")
    public final selectedEffectColumn:EffectColumn;

    @:native("selected_effect_column_index")
    public var selectedEffectColumnIndex:Int;

    /**
     * The currently edited sub column type within the selected note/effect column.
     */
    @:native("selected_sub_column_type")
    public final selectedSubColumnType:SubColumnType;

    /**
     * Read/write access to the selection in the pattern editor.
     * 
     * Line indexes are valid from 1 to patterns[].number_of_lines Track indexes are valid from 1 to #tracks Column indexes are valid from 1 to (tracks[].visible_note_columns + tracks[].visible_effect_columns)
     * 
     * When setting the selection, all members are optional. Combining them in various different ways will affect how specific the selection is. When selection_in_pattern returns nil or is set to nil, no selection is present.
     */
    @:native("selection_in_pattern")
    public var selectionInPattern:PatternSelection;

    /**
     * The currently edited line in the currently edited phrase. Nil when no phrase is selected.
     */
    @:native("selected_phrase_line")
    public final selectedPhraseLine:PatternLine;

    /**
     * The currently edited line index in the currently edited phrase. 0 when no phrase is selected.
     */
    @:native("selected_phrase_line_index")
    public var selectedPhraseLineIndex:Int;

    /**
     * The currently edited column in the selected line in the currently edited phrase. Nil when no phrase is selected or when an effect column is selected.
     */
    @:native("selected_phrase_note_column")
    public final selectedPhraseNoteColumn:NoteColumn;

    /**
     * The currently edited column index in the selected line in the currently edited phrase. 0 when no phrase is selected or when an effect column is selected.
     */
    @:native("selected_phrase_note_column_index")
    public var selectedPhraseNoteColumnIndex:Int;

    /**
     * The currently edited column in the selected line in the currently edited phrase. Nil when no phrase is selected or when a note column is selected.
     */
    @:native("selected_phrase_effect_column")
    public final selectedPhraseEffectColumn:EffectColumn;

    /**
     * The currently edited effect column index in the selected line in the currently edited phrase. 0 when no phrase is selected or when a note column is selected.
     */
    @:native("selected_phrase_effect_column_index")
    public var selectedPhraseEffectColumnIndex:Int;

    /**
     * The currently edited sub column type within the selected note/effect column in the current phrase. 0 when no phrase is selected.
     */
    @:native("selected_phrase_sub_column_type")
    public final selectedPhraseSubColumnType:SubColumnType;

    /**
     * Same as `selectionInPattern` but for the currently selected phrase (if any).
     */
    @:native("selection_in_phrase")
    public var selectionInPhrase:PhraseSelection;

    /**
     * True while an undo/redo action is invoked. This may be useful to check in notifiers, to figure out if the document currently changes because of an undo/redo operation.
     * @return Bool
     */
    @:native("is_undo_redoing")
    public function isUndoRedoing():Bool;

    /**
     * Test if something in the song can be undone.
     * @return Bool
     */
    @:native("can_undo")
    public function canUndo():Bool;

    /**
     * Undo the last performed action. Will do nothing if nothing can be undone.
     */
    @:native("undo")
    public function undo():Void;

    /**
     * Test if something in the song can be redone.
     * @return Bool
     */
    @:native("can_redo")
    public function canRedo():Bool;

    /**
     * Redo a previously undo action. Will do nothing if nothing can be redone.
     */
    @:native("redo")
    public function redo():Void;

    /**
     * When modifying the song, Renoise will automatically add descriptions for undo/redo by looking at what first changed (a track was inserted, a pattern line changed, and so on). When the song is changed from an action in a menu entry callback, the menu entry's label will automatically be used for the undo description. If those auto-generated names do not work for you, or you want to use something more descriptive, you can, **before changing anything in the song**, give your changes a custom undo description (like: "Generate Synth Sample")
     * @param description 
     */
    @:native("describe_undo")
    public function describeUndo(description:String):Void;

    /**
     * Same as `describe_undo`, but additionally this tries to merge the following changes to the document with the last one, if the description matches the last description and the given timeout was not reached since the last describe_batch_undo call.
     * 
     * Calls to `describe_undo` from other tools, or from Renoise internally, will cancel batches and split the undo action.
     * 
     * Batches can be useful to combine multiple changes in the document into a single udo/redo step, when the changes happen asynchroniously, for example a process sliced action (via Lua coroutines).
     * @param description 
     * @param timeoutMs 
     */
    @:native("describe_batch_undo")
    public function describeBatchUndo(description:String, ?timeoutMs:Float):Void;

    /**
     * Insert a new track at the given index. Inserting a track behind or at the Master Track's index will create a Send Track. Otherwise, a regular track is created.
     * @param index 
     * @return Track
     */
    @:native("insert_track_at")
    public function insertTrackAt(index:Int):Track;

    /**
     * Delete an existing track. The Master track can not be deleted, but all Sends can. Renoise needs at least one regular track to work, thus trying to delete all regular tracks will fire an error.
     * @param index 
     */
    @:native("delete_track_at")
    public function deleteTrackAt(index:Int):Void;

    /**
     * Swap the positions of two tracks. A Send can only be swapped with a Send track and a regular track can only be swapped with another regular track. The Master can not be swapped at all.
     * @param index1 
     * @param index2 
     */
    @:native("swap_tracks_at")
    public function swapTracksAt(index1:Int, index2:Int):Void;

    /**
     * Access to a single track by index. Use properties `tracks` to iterate over all tracks and to query the track count.
     * @param index 
     * @return Track
     */
    @:native("track")
    public function track(index:Int):Track;

    /**
     * Set the selected track to next relative to the current track. Takes care of skipping over hidden tracks and wrapping around at the edges.
     */
    @:native("select_previous_track")
    public function selectPreviousTrack():Void;

    /**
     * Insert a new group track at the given index. Group tracks can only be inserted before the Master track.
     * @param index 
     * @return GroupTrack
     */
    @:native("insert_group_at")
    public function insertGroupAt(index:Int):GroupTrack;

    /**
     * Add track at track_index to group at group_index by first moving it to the right spot to the left of the group track, and then adding it. If group_index is not a group track, a new group track will be created and both tracks will be added to it.
     * @param trackIndex 
     * @param groupIndex 
     */
    @:native("add_track_to_group")
    public function addTrackToGroup(trackIndex:Int, groupIndex:Int):Void;

    /**
     * Removes track from its immediate parent group and places it outside it to the left. Can only be called for tracks that are actually part of a group.
     * @param trackIndex 
     */
    @:native("remove_track_from_group")
    public function removeTrackFromGroup(trackIndex:Int):Void;

    /**
     * Delete the group with the given index and all its member tracks. Index must be that of a group or a track that is a member of a group.
     * @param groupIndex 
     */
    @:native("delete_group_at")
    public function deleteGroupAt(groupIndex:Int):Void;

    /**
     * Insert a new instrument at the given index. This will remap all existing notes in all patterns, if needed, and also update all other instrument links in the song. Can't have more than MAX_NUMBER_OF_INSTRUMENTS in a song.
     * @param index 
     * @return Instrument
     */
    @:native("insert_instrument_at")
    public function insertInstrumentAt(index:Int):Instrument;

    /**
     * Delete an existing instrument at the given index. Renoise needs at least one instrument, thus trying to completely remove all instruments is not allowed. This will remap all existing notes in all patterns and update all other instrument links in the song.
     * @param index 
     */
    @:native("delete_instrument_at")
    public function deleteInstrumentAt(index:Int):Void;

    /**
     * Swap the position of two instruments. Will remap all existing notes in all patterns and update all other instrument links in the song.
     * @param index1 
     * @param index2 
     */
    @:native("swap_instruments_at")
    public function swapInstrumentsAt(index1:Int, index2:Int):Void;

    /**
     * Access to a single instrument by index. Use properties `instruments` to iterate over all instruments and to query the instrument count.
     * @param index 
     * @return Instrument
     */
    @:native("instrument")
    public function instrument(index:Int):Instrument;

    /**
     * Captures the current instrument (selects the instrument) from the current note column at the current cursor pos. Changes the selected instrument accordingly, but does not return the result. When no instrument is present at the current cursor pos, nothing will be done.
     */
    @:native("capture_instrument_from_pattern")
    public function captureInstrumentFromPattern():Void;

    /**
     * Tries to captures the nearest instrument from the current pattern track, starting to look at the cursor pos, then advancing until an instrument is found. Changes the selected instrument accordingly, but does not return the result. When no instruments (notes) are present in the current pattern track, nothing will be done.
     */
    @:native("capture_nearest_instrument_from_pattern")
    public function captureNearestInstrumentFromPattern():Void;

    /**
     * Access to a single pattern by index. Use properties 'patterns' to iterate over all patterns and to query the pattern count.
     * @param index 
     * @return Pattern
     */
    @:native("pattern")
    public function pattern(index:Int):Pattern;

    /**
     * Start rendering a section of the song or the whole song to a WAV file.
     * 
     * Rendering job will be done in the background and the call will return back immediately, but the Renoise GUI will be blocked during rendering. The passed `callback` function is called as soon as rendering is done, e.g. successfully completed.
     * 
     * While rendering, the rendering status can be polled with the `Song.rendering` and `Song.renderingProgress` properties, for example, in idle notifier loops. If starting the rendering process fails (because of file IO errors for example), the render function will return false and the error message is set as the second return value. On success, only a single `true` value is returned.
     * 
     * To render only specific tracks or columns, mute the undesired tracks/columns before starting to render.
     * 
     * Parameter `filename` must point to a valid, maybe already existing file. If it already exists, the file will be silently overwritten. The renderer will automatically add a ".wav" extension to the filename, if missing.
     * 
     * Parameter `callback` is ONLY called when rendering has succeeded. You can do something with the file you've passed to the renderer here, like for example loading the file into a sample buffer.
     * @param options 
     * @param filename 
     * @param callback 
     * @return ->Void):Bool
     */
    @:native("render")
    public function render(options:RenderOptions, filename:String, callback:()->Void):AnyOf2<Bool, String>;

    /**
     * When rendering (see rendering, renoise.song().rendering_progress), the current render process is canceled. Otherwise, nothing is done.
     */
    @:native("cancel_rendering")
    public function cancelRendering():Void;

    /**
     * Trigger the given pattern line index in the current pattern for preview purposes. This works similar to the Renoise `PlayCurrentLine` keyboard shortcut, but does now advance the playback position.
     * 
     * If you want to preview a single track's note only, mute other tracks before triggering the pattern line. To stop the preview, invoke `stop()` from the transport.
     * 
     * Transport playback must be stopped for this to work. If it's not, an error is thrown.
     * 
     * This is evaluated from the GUI thread, not a real-time thread, so timing will be a little bit wonky. Don't try to use this as a custom sequencer!
     * @param index 
     */
    @:native("trigger_pattern_line")
    public function triggerPatternLine(index:Int):Void;

    /**
     * Trigger instrument playback with the specified note or a table of notes (a chord) and volume for preview purposes on the given track index.
     * 
     * Send tracks can not play notes. When specifying a send track, notes will play on the master track instead.
     * 
     * This is evaluated from the GUI thread, not a real-time thread, so timing will be a little bit wonky. Only use this to preview instruments from tools and not as a sequencer.
     * @param instrumentIndex 1-based instrument number
     * @param trackIndex 1-based
     * @param note Range 0-119
     * @param volume Range 0-1
     */
    @:native("trigger_instrument_note_on")
    public function triggerInstrumentNoteOn(instrumentIndex:Int, trackIndex:Int, ?note:Array<Int>, ?volume:Float):Void;

    /**
     * Stop instrument playback which previously got started via `triggerInstrumentNoteOn()`.
     * @param instrumentIndex 1-based instrument number
     * @param trackIndex 1-based
     * @param note Range 0-119
     */
    @:native("trigger_instrument_note_off")
    public function triggerInstrumentNoteOff(instrumentIndex:Int, trackIndex:Int, ?note:Array<Int>):Void;

    /**
     * Trigger a sample with the specified note and volume for preview purposes on the given track. This directly triggers the sample, bypassing the instrument's keyzone.
     * 
     * Only use this to preview samples from tools and not as a sequencer. See also `triggerInstrumentNoteOn()`.
     * @param instrumentIndex 
     * @param sampleIndex 
     * @param trackIndex 
     * @param note 
     * @param volume 
     * @param useSelection 
     */
    @:native("trigger_sample_note_on")
    public function triggerSampleNoteOn(instrumentIndex:Int, sampleIndex:Int, trackIndex:Int, ?note:Int, ?volume:Float, ?useSelection:Bool):Void;

    /**
     * Stops sample playback that previously got triggered via `triggerSampleNoteOn()`.
     * @param instrumentIndex 
     * @param sampleIndex 
     * @param trackIndex 
     * @param note 
     */
    @:native("trigger_sample_note_off")
    public function triggerSampleNoteOff(instrumentIndex:Int, sampleIndex:Int, trackIndex:Int, ?note:Int):Void;

    /**
     * Load all global MIDI mappings in the song into a XRNM file. Returns true when loading/saving succeeded, else false and the error message.
     * @param filename 
     * @return AnyOf2<Bool, String>
     */
    @:native("load_midi_mappings")
    public function loadMidiMappings(filename:String):AnyOf2<Bool, String>;

    /**
     * Save all global MIDI mappings in the song into a XRNM file. Returns true when loading/saving succeeded, else false and the error message.
     * @param filename 
     * @return AnyOf2<Bool, String>
     */
    @:native("save_midi_mappings")
    public function saveMidiMappings(filename:String):AnyOf2<Bool, String>;

    /**
     * clear all MIDI mappings in the song
     */
    @:native("clear_midi_mappings")
    public function clearMidiMappings():Void;

}

enum abstract SubColumnType(Int) from Int to Int {
    final SUB_COLUMN_NOTE = 1;
    final SUB_COLUMN_INSTRUMENT = 2;
    final SUB_COLUMN_VOLUME = 3;
    final SUB_COLUMN_PANNING = 4;
    final SUB_COLUMN_DELAY = 5;
    final SUB_COLUMN_SAMPLE_EFFECT_NUMBER = 6;
    final SUB_COLUMN_SAMPLE_EFFECT_AMOUNT = 7;
    final SUB_COLUMN_EFFECT_NUMBER = 8;
    final SUB_COLUMN_EFFECT_AMOUNT = 9;
}

@:native("PatternSelection")
extern typedef PatternSelection = {
    ?start_line:Int,
    ?start_track:Int,
    ?start_column:Int,
    ?end_line:Int,
    ?end_track:Int,
    ?end_column:Int
}

@:native("PhraseSelection")
extern typedef PhraseSelection = {
    ?start_line:Int,
    ?start_column:Int,
    ?end_line:Int,
    ?end_column:Int,
}

@:native("RenderOptions")
extern typedef RenderOptions = {
    ?start_pos:SongPos,
    ?end_pos:SongPos,
    sample_rate:SampleRate,
    bit_depth:BitDepth,
    interpolation:Interpolation,
    priority:Priority,
}

enum abstract SampleRate(Int) from Int to Int {
    final SAMPLE_RATE_22050 = 22050;
    final SAMPLE_RATE_44100 = 44100;
    final SAMPLE_RATE_48000 = 48000;
    final SAMPLE_RATE_88200 = 88200;
    final SAMPLE_RATE_96000 = 96000;
    final SAMPLE_RATE_192000 = 192000;
}

enum abstract BitDepth(Int) from Int to Int {
    final BIT_DEPTH_16 = 16;
    final BIT_DEPTH_24 = 24;
    final BIT_DEPTH_32 = 32;
}

enum abstract Interpolation(String) from String to String {
    final INTERPOLATION_DEFAULT = "default";
    final INTERPOLATION_PRECISE = "precise";
}

enum abstract Priority(String) from String to String {
    final PRIORITY_LOW = "low";
    final PRIORITY_HIGH = "high";
    final PRIORITY_REALTIME = "realtime";
}

