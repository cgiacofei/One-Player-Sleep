##########################################
# Author: MadCat (youtube.com/MadCatHoG) 
# Date: Jun 9, 2017
# Version: 1.1
# Minecraft Version 1.12
# Description:
# One Player Sleep main loop function.
##########################################

scoreboard players tag @a add isSleeping {Sleeping:1b} 
execute @a[tag=isSleeping] ~ ~ ~ scoreboard players enable @a OPSkickBed 
scoreboard players add @e[tag=isSleeping] OPSsleep 1

execute @e[tag=isSleeping,score_OPSsleep=1] ~ ~ ~ tellraw @a ["",{"selector":"@s"},{"text":" is now sleeping","color":"blue","clickEvent":{"action":"run_command","value":"/trigger OPSkickBed set 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Click to kick!","color":"aqua"}]}}}]

execute @a[score_OPSsleep_min=110] ~ ~ ~ time add 40
execute @a[score_OPSsleep_min=300,score_OPSsleep=301] ~ ~ ~ weather thunder 1

function One-Player-Sleep:OPS_kicked if @a[score_OPSkickBed_min=1]

scoreboard players tag @a[tag=isSleeping] remove isSleeping {Sleeping:0b}
scoreboard players set @a[tag=!isSleeping,score_OPSsleep_min=1] OPSsleep 0
