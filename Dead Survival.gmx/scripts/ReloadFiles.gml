//highscores
obj_Control.highscores_file = file_text_open_read("highscores.json"); 
obj_Control.highscores_str = "";
        
do {
    obj_Control.highscores_str += file_text_read_string(highscores_file);
    file_text_readln(obj_Control.highscores_file);
}until file_text_eof(obj_Control.highscores_file)

file_text_close(obj_Control.highscores_file);
obj_Control.players = 0;

obj_Control.highscore_map = jso_decode_map(obj_Control.highscores_str);
    
if (jso_map_check(obj_Control.highscore_map, "p01", "name"))
{
    obj_Control.hsName[players] = jso_map_lookup(highscore_map, "p01", "name");
    obj_Control.hsTotalScore[players] = jso_map_lookup(highscore_map, "p01", "total_score");
    obj_Control.hsAccuracy[players] = jso_map_lookup(highscore_map, "p01", "accuracy");
    obj_Control.hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p01", "zombies_killed");
    obj_Control.hsBuildings[players] = jso_map_lookup(highscore_map, "p01", "buildings");
    obj_Control.hsDays[players] = jso_map_lookup(highscore_map, "p01", "days");
            
    obj_Control.players++;
}
    
if (jso_map_check(obj_Control.highscore_map, "p02", "name"))
{
    obj_Control.hsName[players] = jso_map_lookup(highscore_map, "p02", "name");
    obj_Control.hsTotalScore[players] = jso_map_lookup(highscore_map, "p02", "total_score");
    obj_Control.hsAccuracy[players] = jso_map_lookup(highscore_map, "p02", "accuracy");
    obj_Control.hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p02", "zombies_killed");
    obj_Control.hsBuildings[players] = jso_map_lookup(highscore_map, "p02", "buildings");
    obj_Control.hsDays[players] = jso_map_lookup(highscore_map, "p02", "days");
            
    obj_Control.players++;
}
    
if (jso_map_check(obj_Control.highscore_map, "p03", "name"))
{
    obj_Control.hsName[players] = jso_map_lookup(highscore_map, "p03", "name");
    obj_Control.hsTotalScore[players] = jso_map_lookup(highscore_map, "p03", "total_score");
    obj_Control.hsAccuracy[players] = jso_map_lookup(highscore_map, "p03", "accuracy");
    obj_Control.hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p03", "zombies_killed");
    obj_Control.hsBuildings[players] = jso_map_lookup(highscore_map, "p03", "buildings");
    obj_Control.hsDays[players] = jso_map_lookup(highscore_map, "p03", "days");
            
    obj_Control.players++;
}
    
if (jso_map_check(obj_Control.highscore_map, "p04", "name"))
{
    obj_Control.hsName[players] = jso_map_lookup(highscore_map, "p04", "name");
    obj_Control.hsTotalScore[players] = jso_map_lookup(highscore_map, "p04", "total_score");
    obj_Control.hsAccuracy[players] = jso_map_lookup(highscore_map, "p04", "accuracy");
    obj_Control.hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p04", "zombies_killed");
    obj_Control.hsBuildings[players] = jso_map_lookup(highscore_map, "p04", "buildings");
    obj_Control.hsDays[players] = jso_map_lookup(highscore_map, "p04", "days");
            
    obj_Control.players++;
}
    
if (jso_map_check(obj_Control.highscore_map, "p05", "name"))
{
    obj_Control.hsName[players] = jso_map_lookup(highscore_map, "p05", "name");
    obj_Control.hsTotalScore[players] = jso_map_lookup(highscore_map, "p05", "total_score");
    obj_Control.hsAccuracy[players] = jso_map_lookup(highscore_map, "p05", "accuracy");
    obj_Control.hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p05", "zombies_killed");
    obj_Control.hsBuildings[players] = jso_map_lookup(highscore_map, "p05", "buildings");
    obj_Control.hsDays[players] = jso_map_lookup(highscore_map, "p05", "days");
            
    obj_Control.players++;
}
    
jso_cleanup_map(obj_Control.highscore_map);

//Controls
ini_open("controls.ini");

conFront = ini_read_string("keys", "walk_forward", "NA");
conBack = ini_read_string("keys", "walk_backward", "NA");
conLeft = ini_read_string("keys", "strafe_left", "NA");
conRight = ini_read_string("keys", "strafe_right", "NA");
conBuild = ini_read_string("keys", "bulid_mode", "NA");
conGun1 = ini_read_string("keys", "gun1", "NA");
conGun2 = ini_read_string("keys", "gun2", "NA");
conGun3 = ini_read_string("keys", "gun3", "NA");

ini_close();
