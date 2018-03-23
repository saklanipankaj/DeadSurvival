{
    /**
    jso_map_get_type(map, key): Return the type of value to which the key value <key> is mapped to in <map>.
    JSOnion version: 1.0.0d
    */

    //Grab the value
    var v;
    v = ds_map_find_value(argument0, argument1);
    
    //String; could be string, map or list
    if (is_string(v)) {
        switch (string_char_at(v, 1)) {
            case "s":
                return jso_type_string;
            break;
            case "l":
                return jso_type_list;
            break;
            case "m":
                return jso_type_map;
            break;
            case "b":
                return jso_type_boolean;
            break;
            default: show_error("Invalid map content type.", true); break;
        }    
    }
    
    //Real
    else {
        return jso_type_real;
    }
}
