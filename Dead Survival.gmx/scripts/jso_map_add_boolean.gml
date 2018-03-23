{
    /**
    jso_map_add_boolean(map, key, bool): Add the key-value pair <key>:<bool> to <map>, where <bool> is a boolean value.
    JSOnion version: 1.0.0d
    */
    if (argument2) {
        ds_map_add(argument0, argument1, "btrue");
    } else {
        ds_map_add(argument0, argument1, "bfalse");
    }
}
