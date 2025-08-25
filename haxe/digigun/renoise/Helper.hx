package digigun.renoise;

import lua.Table;

class Helper {
    static public function toArray<T>(t:Table<Int, T>):Array<T> {
        return Table.toArray(t);
    }

    static public function toMap<K, V>(t:Table<K, V>):Map<K, V> {
        return Table.toMap(t);
    }

    static public function toTable<T>(a:Array<T>):Table<Int, T> {
        return Table.fromArray(a);
    }
}

@:multiReturn extern class AnyOf2<A, B> {
    var result1:A;
    var result2:B;
}