package digigun.renoise;

@:native("renoise")
extern class Renoise { 
    @:native("API_VERSION")
    static public final apiVersion:Float;
    @:native("RENOISE_VERSION")
    static public final renoiseVersion:Float;

    @:native("app")
    static public final app:()->Application;

    @:native("song")
    static public final song:()->Song;

    @:native("tool")
    static public final tool:()->ScriptingTool;

}

@:native("")
extern class Global {
    @:native("objinfo")
    public static function objinfo(object:Dynamic):String;

    @:native("oprint")
    public static function oprint(object:Dynamic):Void;

    @:native("rprint")
    public static function rprint(object:Dynamic):Void;
}