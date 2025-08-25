package digigun.renoise;

import digigun.renoise.Document.Observable;
import digigun.renoise.Document.ObservableList;
import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.InstrumentMacro")
extern class InstrumentMacro {
    /**
     * Macro name as visible in the GUI when mappings are presents.
     */
    public var name:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var name_observable:Observable;

    /**
     * Range: (0 - 1)
     */
    public var value:Float;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var value_observable:Observable;

    /**
     * Range: (0 - 100)
     */
    public var value_string:String;

    /**
     * Track changes to document properties or general states by attaching listener functions to it.
     */
    public var value_string_observable:Observable;

    @:native("mappings")
    private var __mappings:Table<Int, InstrumentMacroMapping>;
    /**
     * Macro mappings, target parameters
     */
    public var mappings(get, never):Array<InstrumentMacroMapping>;
    private inline function get_mappings():Array<InstrumentMacroMapping> {
        return __mappings.toArray();
    }

    /**
     * Track changes to document lists by attaching listener functions to it. NB: Notifiers will not broadcast changes made to list items, but only changes to the lists layout (items got added, removed, swapped).
     */
    public var mappings_observable:ObservableList;

    /**
     * Access to a single attached parameter mapping by index. Use property 'mappings' to query mapping count.
     * @param index 
     * @return InstrumentMacroMapping
     */
    public function mapping(index:UInt):InstrumentMacroMapping;
}