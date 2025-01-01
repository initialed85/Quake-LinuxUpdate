Title    : FrikBot X
Filename : fbxc.zip
Version  : 10.2
Date     : 5-19-2006
Author   : Ryan "Frika C" Smith
Email    : frikac@inside3d.com
Credits  : Alan Kivlin for his rankings.qc and step movement
Frog for releasing the Frogbot code and giving me a good goal
to shoot for. Requiem for the modified rankings code for QW
Raymond Martineau, creator of FrikTF and probably my biggest fan.

Additional thanks to static_void, Quest, Asdf and MaNiAc who helped immensly with suggestions, code snippets and ideas.

Great big thanks to everyoe who has used the previous versions of FrikBot in their mods! You are the people that keep this project alive!

Type of Mod
-----------
Quake C  : yes
Sound    : no
MDL      : no
Level    : no

Format of QuakeC (if a Quake C Mod)
-----------------------------------
unified diff  : no
context diff  : no
.qc files     : yes 
progs.dat     : yes


Description of the Modification
-------------------------------

This bot takes a unique approach. Unlike all other bots I've seen, FrikBot actually pretends to be a player. When he fires his weapon, it's the same function that the player uses. It is all done through his button flags. In other words, the bot fakes all client functions, he looks like a Quake client not only to the people in the game, but also to the Quake C. So why did I make him fake client behavior? Well with him using all the player code, he automatically works with hundreds of mods with a few short lines of code added or changed. This bot will play by the game rules of nearly every mod out there. (though he doesn't always know the rules however)

It has been many months since the last version of the FrikBot. I apologize for letting 0.09x just sit around for so long, but Real Life (tm) syndrome, and many other projects garnered for my attention. This will probably be the last edition of FrikBot. (again)

How to Install the Modification
-------------------------------

You must have *REGISTERED QUAKE* to play *ANY* quake mods, including this bot. Quake can easily be purchased from the id website (wwww.idsoftware.com) for about $30 US at the time of this writing, and you can find it much much cheaper at local software stores. This may sound like a silly addition to the readme, but I've actually recieved mail with people trying to use the bot in shareware Quake. Go figure.

Make a sub directory (called a sub-folder on some systems) of your Quake directory entitled "frikbot", then place all files in this archive, using your favorite un-zip utility, in that folder. 

For Normal Quake: Start quake with the parameter "-game frikbot -listen 8".  Choose multiplayer game from the main menu, set up your options and once in the game use "impulse 100" to add a bot. If you are running on the MacOS, I believe you need only to click and drag the frikbot folder onto your Quake executable.

For QuakeWorld: Start QWSV with the parameter "+gamedir frikbot". Connect with QWCL and use impulse 100 to add a bot.

If you did not understand what was just said, please do not e-mail me asking how to install and run this. Go out, download a few Quake mods and figure it out. I'm not going to hand hold you anymore. Quake has been out 5 years now, and there is plenty of info out there on Quake mods.

Before adding bots, you can adjust the difficulty of the bot by use of the skill console variable. The variable accepts a number 0 thru 3, and changes small behaviors of the bot. Skill 3 is the highest setting, and makes the bots 'cheat'. They still follow all rules of the game, but they have "instant look" and a 360 degree fov. Skills 1 and 2 are very similar, but in an odd twist, a skill 1 bot may actually be harder to beat than a skill 2 bot (fixme). Skill 0 is very similar to skill 1, with the exception of many of the advanced AI bits being disabled. In QuakeWorld, skill can be set by typing "localinfo skill X" where x is the bot skill.
 

Impulses
===========
100 Add a bot or add a bot to your team in a team game
101 Add a bot to an enemy team
102 Remove a bot
103 Bot Cam cycle. Cycles through the view of all bots & players currently on the server (Not available in QW)
104 Waypoint Editor mode 

Any suggestions, please mail me at frikac@inside3d.com


Info for Mod Authors
--------------------

Included with this file is all the source you need to build the bot. Instructions to install it onto your code are provided in the files bot.qc and bot_qw.qc. Bot.qc tells you how to install the code into a Normal Quake mod. Bot_qw tells you how to install it into a QuakeWorld mod. Please note, FrikBot doesn't typically work on mods with bots already in the code. You must remove the original bot before installing the FrikBot.

If you release a mod with the FrikBot included please do not include any of the FrikBot text files included with this archive. This usually serves to confuse the general public. You only need to list me in the credits section of your readme, provide basic instructions for operating the bot (the bot impulses), and if you're feeling generous, list my URL (http://www.botepidemic.com/frikbot/) so people can download the bot for their own use.

Please if you release a mod using the FrikBot, try to avoid the phrase "Frik" as part of your mod's title. While typically I don't mind, I like to reserve that for my own work.

Before e-mailing me with a problem, please make absolute sure you followed the instructions for installation completely. Please DO NOT write me asking to install the bot on a mod for you. I don't have the time to work on half of the projects *I* start, and can make no time for other people's code.

The error "SZ_Getspace: Overflow without overflow set" occurs because you are, somewhere, sending direct messages to the bot. I have included wrapper functions in 0.09+ for the Write* commands to prevent some of the occurences of this problem, but I cannot anticipate every possible method you might employ. Multi-centerprints, etc. can also cause it. If you experience problems please look through your code to make certain any function that relies on the client in question actually being a real client is only executed if the client's .ishuman flag is set. 

Technical Details
-----------------

Known Bugs
==========
Bot coding has gotten an order of magnitude more complicated since the last version. Due to this fact, you may notice slow down of the game with many bots on the server. For a general speed boost it is recommended that you use .way files, as the DynamicWaypoint function is a major contributor to the slow down.

The FrikBot bug list has been taken down. I'm maintaining it privately until I find a place easy to post it. If you have a bug that you discover, please e-mail it to frikac@inside3d.com. Thank you for your support!

About .way files
================
.way files are a custom form of config file that stores waypoint data. Contained in each files is a series of commands, when executed on the server console, create waypoints. Way files only work with the Normal Quake version. QWSV's current limitations prevent it from accepting data in this way. 

Revision History
----------------

Changes since v0.10.2
---------------------
* Updated bot_ed.qc to use FRIK_FILE extension.

Changes Since v0.10.1
---------------------
* Fixed a major bug in the routing algorithm
* Included all content from the cancelled "FBX Plus", including waypoints and a jazzed up waypoint editor.

Changes Since v0.10
-------------------
Unknown, this readme was not included with 0.10 or 0.10.1


Changes since v0.09
-------------------
* Better fight code.
* Better all around navigation
* New chat code.
* Loads of new AI code
* Minor changes and bug fixes throughout

Changes since v0.08
-------------------
* Skill settings. 0 = Easy, 1 = Normal, 2 = Hard, 3 = Nightmare
* COOP is back! Bots play coop very poorly.
* Better all around navigation
* New chat code, might be replaced. Too bulky and buggy
* Loads of new AI code
* New teamplay AI (it isn't much, really)
* Merged QW and NQ versions of the bot. Now everyone can't complain that I don't update the QW version enough :)
* Rankings problems corrected. Quake will not crash after players enter/leave. Players joining a game in progress will be able to see the bot's scoreboard.
* Minor changes and bug fixes throughout

Changes since v0.07
-------------------
* Removal of Norse movement. Gone. Started work on new movement AI from scratch.
* scratch1 is no longer valid. Don't use it.
* Implementation of ported Quake physics (don't ask, don't tell is all I will say)
* Bots are now MOVETYPE_WALK. They said it couldn't be done, hah!
* Massive code restructuring, moved code into many files instead of cramming it into three. This was done to really help more with development than anything else.
* Various bug fixes. I can't even remember half of them.
* This is a major rewrite of most of the bot.

Changes since v0.06
-------------------
* Bots viewing angle performed more realistically
* Code restructuring, please pay attention to the upgrade.txt and the new instructions in the comment.
* Finally corrected some troubles with the norse movement, including water jumping and gobs of wasted code.
* Integrated botcam. Use impulse 103 to activate.
* Corrected a bug in the installtion comment
* Bots are thrown around by explosions, I can't believe I missed this before :(
* Bots will switch weapons less often to make some mods less confusing
* Bots will switch to a "close range weapon" sometimes rather than backing off in fightstyles 1 & 3
* New bot roaming method called "Hook Navigation", bugs are still being ironed out on this new roaming concept.
* fisible() improved to work properly with SOLID_BSP objects
* Bots will attack secret doors, & buttons . Helps immensly in some levels.
* Implementation of "scratch1" to adjust bot framerates
* Bots will automatically stagger their think times against other bots so they all don't execute their think at the same time, causing a major slowdown.
* Implementation of check_forward() to improve (ahem) standard roaming.
* Special guest appearance of "JamesBond" as a bot name, in honor of the version number (0.07)
* Misc. other bug fixes

Changes since v0.05
-------------------
* Bot colors show in GL Quake!! Woohoo!!
* Implementation of fov(). Bots now have a limited field of view.
* Bots also have damn good hearing :)
* Bot angles correspond to their view.
* FL_ONGROUND hacks allow better compatibility with some mods.
* Bots have a new fightstyle.
* In teamplay, bots will choose the enemy team with the fewest players when using impulse 101
* Misc. bug fixes and movement hacks.

Changes since v0.04
-------------------
* Implementation of fisible(); a minor improvement over the id standard visible code.
* A bug where in very open levels, the bots would not switch targets upon death, fixed
* Impulse comands moved to a function inside bot.qc, to aid in future updates/changes
* Waypointing disabled in single player
* Bots use client connect again!
* Bots know how to play teamplay deathmatch. Set teamplay to nozero and enjoy!

Changes since v0.03
-------------------
* Bot targeting moved to a priority system
* Bots now fight in a variety of fight styles (circle strafe, hold distance)
* Bots have a delayed sight time
* Bug involving clients being added/removed after a bot has spawned fixed
* Bots select weapons via impulses, chance of discharge in water lowered
* Copyright permissions, new readme format.

Changes since v0.02
-------------------
* Bot's Water Jumping really works now!
* Improved roaming
* Different chat messages and bot names
* Improved comments throughout the code
* KickABot(); implemented to remove bots from the server
* Numerous bug fixes

Changes since v0.01
-------------------
* Bot's Water Jumping now works.
* Bug where any weapon fired using self.v_angle would fire at the wrong pitch
* Error in the comment telling you how to install fixed
* General improvements in the comment.

Copyright and Distribution Permissions
--------------------------------------
I hereby renounce my copyright to all data in this archive and
release it into the public domain. As such, you are granted any
applicable rights associated with public domain material. This includes
the ability to distribute, relicense, etc as you wish.

The content of this archive is provided AS IS. Without warranty
of any kind either express or implied. Your monkey is an uncle.

Availability
------------

This modification is available from the following places:

FrikBot homepage at http://www.inside3d.com/frikbot/fbx/
FrikaC's other projects page at http://www.inside3d.com/frikbot/
The new Quake Archive http://quake.errorabove.com/
