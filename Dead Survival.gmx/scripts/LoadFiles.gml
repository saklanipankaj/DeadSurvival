//Upgrades
upgrade_file = file_text_open_read("upgrades.json"); 
upgrade_str = "";
        
do {
    upgrade_str += file_text_read_string(upgrade_file);
    file_text_readln(upgrade_file);
}until file_text_eof(upgrade_file)

file_text_close(upgrade_file);

upgrade_map = jso_decode_map(upgrade_str);

up01Name = "";
up02Name = "";
up03Name = "";
up04Name = "";

if(jso_map_check(upgrade_map, "UP01", "name"))
{
    up01lvl = 1;
    up01Stats = 100;

    up01Name = jso_map_lookup(upgrade_map, "UP01", "name");
    up01Des = jso_map_lookup(upgrade_map, "UP01", "description");
    up01Levels = 0;
    
    while (jso_map_check(upgrade_map, "UP01", "levels", up01Levels, "value"))
    {
        up01Values[up01Levels] = jso_map_lookup(upgrade_map, "UP01", "levels", up01Levels, "value");
        up01Cost[up01Levels] = jso_map_lookup(upgrade_map, "UP01", "levels", up01Levels, "cost");
        up01Levels++;
    }
}

if(jso_map_check(upgrade_map, "UP02", "name"))
{
    up02lvl = 1;
    up02Stats = 100;

    up02Name = jso_map_lookup(upgrade_map, "UP02", "name");
    up02Des = jso_map_lookup(upgrade_map, "UP02", "description");
    up02Levels = 0;
    
    while (jso_map_check(upgrade_map, "UP02", "levels", up02Levels, "value"))
    {
        up02Values[up02Levels] = jso_map_lookup(upgrade_map, "UP02", "levels", up02Levels, "value");
        up02Cost[up02Levels] = jso_map_lookup(upgrade_map, "UP02", "levels", up02Levels, "cost");
        up02Levels++;
    }
}

if(jso_map_check(upgrade_map, "UP03", "name"))
{
    up03lvl = 1;
    up03Stats = 100;

    up03Name = jso_map_lookup(upgrade_map, "UP03", "name");
    up03Des = jso_map_lookup(upgrade_map, "UP03", "description");
    up03Levels = 0;
    
    while (jso_map_check(upgrade_map, "UP03", "levels", up03Levels, "value"))
    {
        up03Values[up03Levels] = jso_map_lookup(upgrade_map, "UP03", "levels", up03Levels, "value");
        up03Cost[up03Levels] = jso_map_lookup(upgrade_map, "UP03", "levels", up03Levels, "cost");
        up03Levels++;
    }
}

if(jso_map_check(upgrade_map, "UP04", "name"))
{
    up04lvl = 1;
    up04Stats = 100;

    up04Name = jso_map_lookup(upgrade_map, "UP04", "name");
    up04Des = jso_map_lookup(upgrade_map, "UP04", "description");
    up04Levels = 0;
    
    while (jso_map_check(upgrade_map, "UP04", "levels", up04Levels, "value"))
    {
        up04Values[up04Levels] = jso_map_lookup(upgrade_map, "UP04", "levels", up04Levels, "value");
        up04Cost[up04Levels] = jso_map_lookup(upgrade_map, "UP04", "levels", up04Levels, "cost");
        up04Levels++;
    }
}

jso_cleanup_map(upgrade_map);

//highscores
highscores_file = file_text_open_read("highscores.json"); 
highscores_str = "";
        
do {
    highscores_str += file_text_read_string(highscores_file);
    file_text_readln(highscores_file);
}until file_text_eof(highscores_file)

file_text_close(highscores_file);
players = 0;

highscore_map = jso_decode_map(highscores_str);
    
if (jso_map_check(highscore_map, "p01", "name"))
{
    hsName[players] = jso_map_lookup(highscore_map, "p01", "name");
    hsTotalScore[players] = jso_map_lookup(highscore_map, "p01", "total_score");
    hsAccuracy[players] = jso_map_lookup(highscore_map, "p01", "accuracy");
    hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p01", "zombies_killed");
    hsBuildings[players] = jso_map_lookup(highscore_map, "p01", "buildings");
    hsDays[players] = jso_map_lookup(highscore_map, "p01", "days");
            
    players++;
}
    
if (jso_map_check(highscore_map, "p02", "name"))
{
    hsName[players] = jso_map_lookup(highscore_map, "p02", "name");
    hsTotalScore[players] = jso_map_lookup(highscore_map, "p02", "total_score");
    hsAccuracy[players] = jso_map_lookup(highscore_map, "p02", "accuracy");
    hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p02", "zombies_killed");
    hsBuildings[players] = jso_map_lookup(highscore_map, "p02", "buildings");
    hsDays[players] = jso_map_lookup(highscore_map, "p02", "days");
            
    players++;
}
    
if (jso_map_check(highscore_map, "p03", "name"))
{
    hsName[players] = jso_map_lookup(highscore_map, "p03", "name");
    hsTotalScore[players] = jso_map_lookup(highscore_map, "p03", "total_score");
    hsAccuracy[players] = jso_map_lookup(highscore_map, "p03", "accuracy");
    hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p03", "zombies_killed");
    hsBuildings[players] = jso_map_lookup(highscore_map, "p03", "buildings");
    hsDays[players] = jso_map_lookup(highscore_map, "p03", "days");
            
    players++;
}
    
if (jso_map_check(highscore_map, "p04", "name"))
{
    hsName[players] = jso_map_lookup(highscore_map, "p04", "name");
    hsTotalScore[players] = jso_map_lookup(highscore_map, "p04", "total_score");
    hsAccuracy[players] = jso_map_lookup(highscore_map, "p04", "accuracy");
    hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p04", "zombies_killed");
    hsBuildings[players] = jso_map_lookup(highscore_map, "p04", "buildings");
    hsDays[players] = jso_map_lookup(highscore_map, "p04", "days");
            
    players++;
}
    
if (jso_map_check(highscore_map, "p05", "name"))
{
    hsName[players] = jso_map_lookup(highscore_map, "p05", "name");
    hsTotalScore[players] = jso_map_lookup(highscore_map, "p05", "total_score");
    hsAccuracy[players] = jso_map_lookup(highscore_map, "p05", "accuracy");
    hsZombiesKilled[players] = jso_map_lookup(highscore_map, "p05", "zombies_killed");
    hsBuildings[players] = jso_map_lookup(highscore_map, "p05", "buildings");
    hsDays[players] = jso_map_lookup(highscore_map, "p05", "days");
            
    players++;
}
    
jso_cleanup_map(highscore_map);
