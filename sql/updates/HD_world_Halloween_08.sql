DELETE FROM `conditions` WHERE SourceTypeOrReferenceId IN (18,19) AND SourceEntry IN (11360, 11361, 11439, 11440, 11449, 11450);
INSERT INTO `conditions` VALUES
(18, 0, 11360, 0, 23, 87, 0, 0, 0, '', NULL),
(19, 0, 11360, 0, 23, 87, 0, 0, 0, '', NULL),
(18, 0, 11439, 0, 23, 131, 0, 0, 0, '', NULL),
(19, 0, 11439, 0, 23, 131, 0, 0, 0, '', NULL),
(18, 0, 11440, 0, 23, 3576, 0, 0, 0, '', NULL),
(19, 0, 11440, 0, 23, 3576, 0, 0, 0, '', NULL),
(18, 0, 11361, 0, 23, 362, 0, 0, 0, '', NULL),
(19, 0, 11361, 0, 23, 362, 0, 0, 0, '', NULL),
(18, 0, 11449, 0, 23, 85, 0, 0, 0, '', NULL),
(19, 0, 11449, 0, 23, 85, 0, 0, 0, '', NULL),
(18, 0, 11450, 0, 23, 3665, 0, 0, 0, '', NULL),
(19, 0, 11450, 0, 23, 3665, 0, 0, 0, '', NULL);

UPDATE `quest_template` SET `ExclusiveGroup` = 11360 WHERE `entry` IN (11360, 11361, 11439, 11440, 11449, 11450);
UPDATE `quest_template` SET `ExclusiveGroup` = 12135, `PrevQuestId` = 11360 WHERE `entry`IN (12135, 11131);
UPDATE `quest_template` SET `ExclusiveGroup` = 12139, `PrevQuestId` = 11361 WHERE `entry`IN (12139, 11219);
UPDATE `quest_template` SET `ExclusiveGroup` = 12133 WHERE `entry` IN (12133, 12155);
UPDATE `quest_template` SET `PrevQuestId` = 12133 WHERE `entry` IN (11135, 11220);
DELETE FROM `creature_questrelation` WHERE `quest` IN (11131, 11219);

UPDATE `creature_template` SET `ScriptName` = 'npc_halloween_orphan_matron' WHERE `entry` IN (24519, 23973);

DELETE FROM creature_text WHERE entry=23543;
INSERT INTO creature_text (entry, groupid, id, TEXT, TYPE, LANGUAGE, probability, emote, duration, sound, COMMENT) VALUES
(23543,1,0,'¡Preparáos, las campanas han repicado, proteged a cada niño débil y anciano! ¡Saldaremos las cuentas! ¡Suplicad piedad! ¡Pagaréis vuestras afrentas!',14,0,100,1,0,11966,'Shade of the Horseman - Horseman Bomb'),
(23543,2,0,'¡Mis llamas han muerto, no queda ya chispa, ahora seré yo quién os rompa la crisma!',14,0,100,1,0,11968,'Shade of the Horseman - Horseman Out'),
(23543,3,0,'¡El fuego arde, éxito no habéis tenido. No os quepa duda, ya la justícia se ha servido!',14,0,100,1,0,11967,'Shade of the Horseman - Horseman Fire'),
(23543,4,0,'<%s se ríe>',16,0,100,11,0,11975,'Shade of the Horseman - Laugh1'),
(23543,4,1,'<%s se ríe>',16,0,100,11,0,12119,'Shade of the Horseman - Laugh2');
