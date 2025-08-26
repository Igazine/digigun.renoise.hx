package digigun.renoise;

/**
 * renoise.Document classes are wrappers for Renoise's internal document classes.
 * 
 * Please note: the Lua wrappers are not really "the Lua way" of solving and expressing things. e.g: there's no support for mixed types in lists, tuples at the moment.
 * 
 * Documents can be serialized from/to XML, just like Renoise's internal document and are observable.
 * 
 * An empty document (node) object can be created via renoise.Document.create("MyDoc"){}
 * 
 * Such document objects can then be extended with the document's add_property function. Existing properties can also be removed again with the remove_property function.
 * 
 * As an alternative to renoise.Document.create, you can also inherit from renoise.Document.DocumentNode in order to create your own document classes. This is especially recommended when dealing with more complex docs, because you can also use additional methods to deal with your properties, the data.
 */
@:native("renoise.Document")
extern class Document {
    public function create(modelName:String):Void;
}

@:native("renoise.Document.DocumentNode")
extern class DocumentNode {
    
}

@:native("renoise.Document.Observable")
extern class Observable {
    /**
     * Checks if the given function, method was already registered as notifier.
     * @param notifier 
     * @return Bool
     */
    @:native("has_notifier")
    public function hasNotifier(notifier:NotifierFunction):Bool;

    /**
     * Register a function or method as a notifier, which will be called as soon as the observable's value changed. The passed notifier can either be a function or a table with a function and some context (an "object") -> method.
     * @param notifier 
     */
    @:native("add_notifier")
    public function addNotifier(notifier:NotifierFunction):Void;

    /**
     * Unregister a previously registered notifier. When only passing an object, all notifier functions that match the given object will be removed. This will not fire errors when no methods for the given object are attached. Trying to unregister a function or method which wasn't registered, will resolve into an error.
     * @param notifier 
     */
    @:native("remove_notifier")
    public function removeNotifier(notifier:NotifierFunction):Void;
}

@:native("renoise.Document.ObservableList")
extern class ObservableList {
    /**
     * Returns the number of entries of the list.
     * @return Int
     */
    @:native("size")
    public function size():Int;

    /**
     * Checks if the given function, method was already registered as notifier.
     * @param notifier 
     * @return Bool
     */
    @:native("has_notifier")
    public function hasNotifier(notifier:ListNotifierFunction):Bool;

    /**
     * Register a function or method as a notifier, which will be called as soon as the observable lists layout changed. The passed notifier can either be a function or a table with a function and some context (an "object") -> method.
     * @param notifier 
     */
    @:native("add_notifier")
    public function addNotifier(notifier:ListNotifierFunction):Void;

    /**
     * Unregister a previously registered list notifier. When only passing an object, all notifier functions that match the given object will be removed. This will not fire errors when no methods for the given object are attached. Trying to unregister a function or method which wasn't registered, will resolve into an error.
     * @param notifier 
     */
    @:native("remove_notifier")
    public function removeNotifier(notifier:ListNotifierFunction):Void;
}

@:native("renoise.Document.ObservableString")
extern class ObservableString extends Observable {
    public var value:String;

    /**
     * Serialize an object to a string.
     * @return String
     */
    @:native("to_string")
    public function toString():String;

    /**
     * Assign the object's value from a string - when possible. Errors are silently ignored.
     * @param value 
     * @return String
     */
    @:native("from_string")
    public function fromString(value:String):String;
}

/**
 * A document list is a document sub component which may contain other document nodes in an observable list.
 */
@:native("renoise.Document.DocumentList")
extern class DocumentList {

}

@:native("NotifierFunction")
extern typedef NotifierFunction = Void->Void;

@:native("ListNotifierFunction")
extern typedef ListNotifierFunction = (ListElementChange)->Void;

@:native("ListElementChange")
extern typedef ListElementChange = Dynamic;

@:native("ListElementAdded")
extern typedef ListElementAdded = {
    index:Int,
    type:String,
}

@:native("ListElementRemoved")
extern typedef ListElementRemoved = {
    index:Int,
    type:String,
}

@:native("ListElementsSwapped")
extern typedef ListElementsSwapped = {
    index1:Int,
    index2:Int,
    type:String,
}

