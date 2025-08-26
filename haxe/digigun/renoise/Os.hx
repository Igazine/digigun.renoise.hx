package digigun.renoise;

import lua.Table;

using digigun.renoise.Helper;

@:native("renoise.OS")
extern class Os {
    /**
     * Returns the platform the script is running on:
     * @return OsType
     */
    static public function platform():OsType;

    /**
     * Returns the current working dir. Will always be the scripts directory when executing a script from a file
     * @return String
     */
    static public function currentdir():String;

    @:native("dirnames")
    static private function __dirnames(path:String):Table<Int, String>;
    /**
     * Returns a list of directory names (names, not full paths) for the given parent directory. Passed directory must be valid, or an error will be thrown.
     * @param path 
     * @return Array<String>
     */
    static public inline function dirnames(path:String):Array<String> {
        return this.__dirnames(path).toArray();
    }

    @:native("filenames")
    static private function __filenames(path:String, ?file_extensions:Table<Int, String>):Table<Int, String>;
    /**
     * Returns a list of file names (names, not full paths) for the given parent directory. Passed directory must be valid, or an error will be thrown.
     * @param path
     * @param file_extensions
     * @return Array<String>
     */
    static public inline function filenames(path:String, ?file_extensions:Array<String>):Array<String> {
        return this.__filenames(path, file_extensions?.toTable()).toArray();
    }

    /**
     * Creates a new directory. mkdir can only create one new sub directory at the same time. If you need to create more than one sub dir, call mkdir multiple times. Returns true if the operation was successful; in case of error, it returns nil plus an error string.
     * @param path 
     * @return AnyOf2<Bool, String>
     */
    static public function mkdir(path:String):AnyOf2<Bool, String>;

    /**
     * Moves a file or a directory from path 'src' to 'dest'. Unlike 'os.rename' this also supports moving a file from one file system to another one. Returns true if the operation was successful; in case of error, it returns nil plus an error string.
     * @param src 
     * @param dest 
     * @return AnyOf2<Bool, String>
     */
    static public function move(src:String, dest:String):AnyOf2<Bool, String>;

    /**
     * Changed in Renoises: Returns a temp directory and name which renoise will clean up on exit.
     * @param extension 
     * @return String
     */
    static public function tmpname(?extension:String):String;

    /**
     * Replaced with a high precision timer (still expressed in milliseconds)
     * @return Float
     */
    static public function clock():Float;

    /**
     * Will not exit, but fire an error that os.exit() can not be called
     */
    static public function exit():Void;
}

enum abstract OsType(String) from String {
    var LINUX;
    var MACINTOSH;
    var WINDOWS;
}