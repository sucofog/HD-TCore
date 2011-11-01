DELETE FROM `conditions` WHERE SourceTypeOrReferenceId IN (18,19) AND SourceEntry IN (11360, 11361, 11439, 11440, 11449, 11450);
INSERT INTO `conditions` VALUES
-- Fire Brigade Practice (Alliance) Area dependance
(18, 0, 11360, 0, 23, 87, 0, 0, 0, '', NULL),
(19, 0, 11360, 0, 23, 87, 0, 0, 0, '', NULL),
(18, 0, 11439, 0, 23, 131, 0, 0, 0, '', NULL),
(19, 0, 11439, 0, 23, 131, 0, 0, 0, '', NULL),
(18, 0, 11440, 0, 23, 3576, 0, 0, 0, '', NULL),
(19, 0, 11440, 0, 23, 3576, 0, 0, 0, '', NULL),
-- Fire Training (Horde) Area dependance
(18, 0, 11361, 0, 23, 362, 0, 0, 0, '', NULL),
(19, 0, 11361, 0, 23, 362, 0, 0, 0, '', NULL),
(18, 0, 11449, 0, 23, 85, 0, 0, 0, '', NULL),
(19, 0, 11449, 0, 23, 85, 0, 0, 0, '', NULL),
(18, 0, 11450, 0, 23, 3665, 0, 0, 0, '', NULL),
(19, 0, 11450, 0, 23, 3665, 0, 0, 0, '', NULL),
-- For accepting "Let the fires come" player must have completed at least one of the Fire Brigade Training quests (Alliance)
(18, 0, 12135, 0, 28, 11360, 0, 0, 0, '', NULL),
(18, 0, 12135, 1, 28, 11439, 0, 0, 0, '', NULL),
(18, 0, 12135, 2, 28, 11440, 0, 0, 0, '', NULL),
(19, 0, 12135, 0, 28, 11360, 0, 0, 0, '', NULL),
(19, 0, 12135, 1, 28, 11439, 0, 0, 0, '', NULL),
(19, 0, 12135, 2, 28, 11440, 0, 0, 0, '', NULL),
-- For accepting Stop the Fires! player must have completed at least one of the Fire Brigade Training quests (Alliance)
(18, 0, 11131, 0, 28, 11360, 0, 0, 0, '', NULL),
(18, 0, 11131, 1, 28, 11439, 0, 0, 0, '', NULL),
(18, 0, 11131, 2, 28, 11440, 0, 0, 0, '', NULL),
(19, 0, 11131, 0, 28, 11360, 0, 0, 0, '', NULL),
(19, 0, 11131, 1, 28, 11439, 0, 0, 0, '', NULL),
(19, 0, 11131, 2, 28, 11440, 0, 0, 0, '', NULL),
-- For accepting "Let the fires come" player must have completed at least one of the Fire Brigade Training quests (Horde)
(18, 0, 12139, 0, 28, 11361, 0, 0, 0, '', NULL),
(18, 0, 12139, 1, 28, 11449, 0, 0, 0, '', NULL),
(18, 0, 12139, 2, 28, 11450, 0, 0, 0, '', NULL),
(19, 0, 12139, 0, 28, 11361, 0, 0, 0, '', NULL),
(19, 0, 12139, 1, 28, 11449, 0, 0, 0, '', NULL),
(19, 0, 12139, 2, 28, 11450, 0, 0, 0, '', NULL),
-- For accepting Stop the Fires! player must have completed at least one of the Fire Brigade Training quests (Horde)
(18, 0, 11219, 0, 28, 11361, 0, 0, 0, '', NULL),
(18, 0, 11219, 1, 28, 11449, 0, 0, 0, '', NULL),
(18, 0, 11219, 2, 28, 11450, 0, 0, 0, '', NULL),
(19, 0, 11219, 0, 28, 11361, 0, 0, 0, '', NULL),
(19, 0, 11219, 1, 28, 11449, 0, 0, 0, '', NULL),
(19, 0, 11219, 2, 28, 11450, 0, 0, 0, '', NULL);

-- Fire Brigade Practice (Alliance) (Only 1 may be completed)
UPDATE `quest_template` SET `ExclusiveGroup` = 11360 WHERE `entry` IN (11360, 11439, 11440);
-- Fire Training (Horde) (Only 1 may be completed)
UPDATE `quest_template` SET `ExclusiveGroup` = 11361 WHERE `entry` IN (11361, 11449, 11450);
-- "Let the fires come" and Stop the Fires! (Only 1 may be completed)
UPDATE `quest_template` SET `ExclusiveGroup` = 12135, `PrevQuestId` = 0 WHERE `entry`IN (12135, 11131); -- Alliance
UPDATE `quest_template` SET `ExclusiveGroup` = 12139, `PrevQuestId` = 0 WHERE `entry`IN (12139, 11219); -- Horde
-- The Headless Horseman may only be taken if completed the quest "Smashing the pumpkin"
UPDATE `quest_template` SET `RequiredRaces` = 1101, `ExclusiveGroup` = 0, `PrevQuestId` = 12133 WHERE `entry` = 11135; -- Alliance
UPDATE `quest_template` SET `RequiredRaces` = 690, `ExclusiveGroup` = 0, `PrevQuestId` = 12155 WHERE `entry` = 11220; -- Horde
-- Remove quest giver for Stop the fires! (It's added to offered quests via script only when Horseman is already Spawned)
DELETE FROM `creature_questrelation` WHERE `quest` IN (11131, 11219);

UPDATE `creature_template` SET `ScriptName` = 'npc_halloween_orphan_matron' WHERE `entry` IN (24519, 23973);
UPDATE `creature_template` SET `ScriptName` = 'npc_shade_horseman' WHERE `entry` = 23543;

DELETE FROM creature_text WHERE entry=23543;
INSERT INTO creature_text (entry, groupid, id, TEXT, TYPE, LANGUAGE, probability, emote, duration, sound, COMMENT) VALUES
(23543,1,0,'¡Preparáos, las campanas han repicado, proteged a cada niño débil y anciano! ¡Saldaremos las cuentas! ¡Suplicad piedad! ¡Pagaréis vuestras afrentas!',14,0,100,1,0,11966,'Shade of the Horseman - Horseman Bomb'),
(23543,2,0,'¡Mis llamas han muerto, no queda ya chispa, ahora seré yo quién os rompa la crisma!',14,0,100,1,0,11968,'Shade of the Horseman - Horseman Out'),
(23543,3,0,'¡El fuego arde, éxito no habéis tenido. No os quepa duda, ya la justícia se ha servido!',14,0,100,1,0,11967,'Shade of the Horseman - Horseman Fire'),
(23543,4,0,'<%s se ríe>',16,0,100,11,0,11975,'Shade of the Horseman - Laugh1'),
(23543,4,1,'<%s se ríe>',16,0,100,11,0,12119,'Shade of the Horseman - Laugh2');