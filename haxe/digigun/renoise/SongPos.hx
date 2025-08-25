package digigun.renoise;

/**
 * Helper class used in Transport and Song, representing a position in the song.
 */
@:native("renoise.SongPos")
extern class SongPos {
    /**
     * Position in the pattern sequence.
     */
    @:native("sequence")
    public var sequence:Int;

    /**
     * Position in the pattern at the given pattern sequence.
     */
    @:native("line")
    public var line:Int;
    
    @:selfCall public function new():Void;
}