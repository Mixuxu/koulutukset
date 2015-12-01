CREATE TABLE `Koulutus` (
  `koulutus_id` int(11) NOT NULL AUTO_INCREMENT,
  `luontiaikapvm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aloitusaikapvm` timestamp NOT NULL DEFAULT '2015-03-03 13:00:00',
  `lopetusaikapvm` timestamp NOT NULL DEFAULT '2015-03-03 14:00:00',
  `opettaja` varchar(50) CHARACTER SET latin1 NOT NULL,
  `aihe` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kouluttaja` varchar(50) CHARACTER SET latin1 NOT NULL,
  `paikka` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kuvaus` varchar(250) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`koulutus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;