{
    /**
    jso_encode_list(list): Return a JSON-encoded version of list <list>.
    JSOnion version: 1.0.0d
    */
    
    //Iteratively encode each element
    var i, l, s;
    s = "";
    l = ds_list_size(argument0);
    for (i=0; i<l; i+=1) {
        //Prepend comma except for the first element
        if (i > 0) {
            s += ",";
        }
        //Select correct encoding for each element, then recursively encode each
        switch (jso_list_get_type(argument0, i)) {
            case jso_type_real:
                s += jso_encode_real(jso_list_get(argument0, i));
            break;
            case jso_type_string:
                s += jso_encode_string(jso_list_get(argument0, i));
            break;
            case jso_type_map:
                s += jso_encode_map(jso_list_get(argument0, i));
            break;
            case jso_type_list:
                s += jso_encode_list(jso_list_get(argument0, i));
            break;
            case jso_type_boolean:
                s += jso_encode_boolean(jso_list_get(argument0, i));
            break;
        }
    }
    
    //Done, add square brackets
    return "[" + s + "]";
}
