{
    /**
    jso_list_add_boolean(list, bool): Append the boolean value <bool> to <list>.
    JSOnion version: 1.0.0d
    */
    if (argument1) {
        ds_list_add(argument0, "btrue");
    } else {
        ds_list_add(argument0, "bfalse");
    }
}
