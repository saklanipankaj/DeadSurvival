zombiesCreated = 0;                                 //Total Number of Zombies Created in the round
scale = 0.5;                                        //Scale of all the objects in the game
alarm[3] = 4*60;                                    //Duration of Loading Screen

buildMode = false;
fullscreen = true;
restart = false;
loading = true;
loadingNum = 0;

//Slider for Options Menu
maxSliderX = 1405;
minSliderX = 595;

//Building Variables
//Turret
turretRange = 200;
turretDmg = 25;
turretHp = 15;
turretFireRate = 30;                                        //Lower Faster Shooting
turretCurrent = 0;                                     

//Tower
towerRange = 400;
towerDmg = 40;
towerHp = 30;
towerFireRate = 60;                                             //Lower Faster Shooting
towerCurrent = 0;

rockNum = 50;
treeNum = 90;
pondNum = 2;

num = 0;                                                            //Used to make the wave cleared animation
buildSelect  = 0;                                                   //Used in BuildMode to decide which Building the player has currently selected
roundNum = 1;                                                       //Current Round

//Zombie Variables
minZombie = 10;
maxZombie = 25;
zombiePRadius = 500;
zombieHRadius = 600;
wanderTime = 20 * 60;                                               //Maximum Time a Zombie can Wander
zombies = irandom_range(minZombie,maxZombie)*roundNum;              //Decide the number of Zombies in a round
zombiesRemaining = zombies;                                         //Remaining Zombies that need to be killed to end round

//Crate Variables
minCrate = 20;
maxCrate = 35;
minSupplies = 5;
maxSupplies = 15;
minAmmo = 5;
maxAmmo = 20;
crateNum = irandom_range(minCrate,maxCrate);                        //Decide the number of crates in a round
crateCreated = 0;                                                   //Total Crates Created 

//constants
gun1_dmg = 40;
gun2_dmg = 45;
gun3_dmg = 50;

//highscore values
shots_fired = 0;
shots_hit = 0;
zombies_killed = 0;
buildings = 0;
hp_loss = 0;

supplies = 100;
ammo = 100;
p_maxHp = 100;
h_maxHp = 500;
accuracy = 10;
spd = 5;

initPHp = p_maxHp;
initHHp = h_maxHp;
initAccuracy = accuracy;
initSpd = spd;

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

hsFileName[0] = "name";
hsFileName[1] = "total_score";
hsFileName[2] = "accuracy";
hsFileName[3] = "zombies_killed";
hsFileName[4] = "buildings";
hsFileName[5] = "days";
    
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

//Controls
ini_open("controls.ini");

conFront = string_upper(ini_read_string("keys", "walk_forward", "N/A"));
conBack = string_upper(ini_read_string("keys", "walk_backward", "N/A"));
conLeft = string_upper(ini_read_string("keys", "strafe_left", "N/A"));
conRight = string_upper(ini_read_string("keys", "strafe_right", "N/A"));
conBuild = string_upper(ini_read_string("keys", "build_mode", "N/A"));
conGun1 = ini_read_string("keys", "gun1", "N/A");
conGun2 = ini_read_string("keys", "gun2", "N/A");
conGun3 = ini_read_string("keys", "gun3", "N/A");

arrFileName[0] = "walk_forward";
arrFileName[1] = "walk_backward";
arrFileName[2] = "strafe_left";
arrFileName[3] = "strafe_right";
arrFileName[4] = "build_mode";
arrFileName[5] = "gun1";
arrFileName[6] = "gun2";
arrFileName[7] = "gun3";

arrControlName[0] = "Forward";
arrControlName[1] = "Backward";
arrControlName[2] = "Left";
arrControlName[3] = "Right";
arrControlName[4] = "Build Mode";
arrControlName[5] = "Gun 1(Pistol)";
arrControlName[6] = "Gun 2(Rifle)";
arrControlName[7] = "Gun 3(Shotgun)";

arrControlKeys[0] = conFront;
arrControlKeys[1] = conBack;
arrControlKeys[2] = conLeft;
arrControlKeys[3] = conRight;
arrControlKeys[4] = conBuild;
arrControlKeys[5] = conGun1;
arrControlKeys[6] = conGun2;
arrControlKeys[7] = conGun3;

for (i = 0; i < 8; i++)
{
    arrTempKeys[i] = arrControlKeys[i];
}

ini_close();
