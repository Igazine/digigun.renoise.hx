package digigun.renoise;

/**
 * A single effect column in a pattern line.
 * 
 * Access effect column properties either by values (numbers) or by strings. The string representation uses exactly the same notation as you see them in Renoise's pattern or phrase editor.
 */
@:native("renoise.EffectColumn")
extern class EffectColumn {
    /**
     * True, when all effect column properties are empty.
     */
    @:native("is_empty")
    public final isEmpty:Bool;

    /**
     * True, when this column is selected in the pattern or phrase editor.
     */
    @:native("is_selected")
    public final isSelected:Bool;

    /**
     * 0-65535 in the form 0x0000xxyy where xx=effect char 1 and yy=effect char 2
     */
    @:native("number_value")
    public var numberValue:UInt;

    /**
     * Range: ('00' - 'ZZ')
     */
    @:native("number_string")
    public var numberString:String;

    /**
     * Range: (0 - 255)
     */
    @:native("amount_value")
    public var amountValue:UInt;

    /**
     * Range: ('00' - 'FF')
     */
    @:native("amount_string")
    public var amountString:String;

    /**
     * Clear the effect column.
     */
    public function clear():Void;

    /**
     * Copy the column's content from another column.
     * @param other 
     */
    @:native("copy_from")
    public function copyFrom(other:EffectColumn):Void;
}