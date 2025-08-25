package digigun.renoise;

import digigun.renoise.Track;
import lua.Table;

using digigun.renoise.Helper;

/**
 * Group track component of a Renoise song.
 */
@:native("renoise.GroupTrack")
extern class GroupTrack extends Track {
    /**
     * All member tracks of this group, including subgroups and their tracks.
     */
    @:native("members")
    private final __members:Table<Int, Track>;
    public var members(get, never):Array<Track>;
    private inline function get_members():Array<Track> {
        return __members.toArray();
    }

    /**
     * Collapsed/expanded visual appearance of whole group.
     */
    @:native("group_collapsed")
    public var groupCollapsed:Bool;
}