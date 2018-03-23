highscore_map = jso_new_map();

for (i = 0; i < obj_Control.players; i++)
{
    player_map = jso_new_map();
    jso_map_add_string(player_map, obj_Control.hsFileName[0], string(obj_Control.hsName[i]));
    jso_map_add_string(player_map, obj_Control.hsFileName[1], string(obj_Control.hsTotalScore[i]));
    jso_map_add_string(player_map, obj_Control.hsFileName[2], string(obj_Control.hsAccuracy[i]));
    jso_map_add_string(player_map, obj_Control.hsFileName[3], string(obj_Control.hsZombiesKilled[i]));
    jso_map_add_string(player_map, obj_Control.hsFileName[4], string(obj_Control.hsBuildings[i]));
    jso_map_add_string(player_map, obj_Control.hsFileName[5], string(obj_Control.hsDays[i]));
    
    jso_map_add_submap(highscore_map, "p0" + string(i+1), player_map);  
}

highscores_file = file_text_open_write("highscores.json");
file_text_write_string(highscores_file, jso_encode_map(highscore_map));
file_text_close(highscores_file);
